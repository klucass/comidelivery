class PainelController < ApplicationController
	before_action :require_authentication, :require_have_restaurant
	before_action :store_return_to
	before_action :get_usuario
	before_action :get_restaurante
	before_action :get_pedidos
	before_action :get_qtde_pedidos_abertos

	###
	# Ciclo do pedido
	# 0 - Default
	# 1 -
	#
	###

	def index
	redirect_to painel_pedidos_path
	end

	def pedidos
		@vendas = @pedidos.to_a.sum { |item| item.preco_total }
	end

	def produtos
		@produtos = Item.where(restaurante_id: @restaurante.id).order(:categoria_id)
	end

	def pizzas #mostra os SABORES de pizza do restaurante
		@sabores = SaboresDePizza.where(restaurante_id: @restaurante.id)
	end

	def new_sabor #cria um novo SaborDePizza
		@sabor = SaboresDePizza.new
	end

	def create_sabor

		@sabor = SaboresDePizza.new(sabor_params)
		@sabor.restaurante_id = current_user.restaurante.id



		respond_to do |format|
	    	if @sabor.save(sabor_params)
	        	format.html { redirect_to painel_pizzas_path, notice: "Sabor de pizza criada com sucesso."}
	        	format.json { render :show, status: :created, location:  item_path }
	      	else
	        	format.html { render :new }
	        	format.json { render json: @pizza.errors, status: :unprocessable_entity }
	      	end
  		end
	end

	def edit_sabor
		@sabor = SaboresDePizza.find(params[:id])
	end

	def update_sabor
		@sabor = SaboresDePizza.find(params[:id])

		if @sabor.update(sabor_params)
			redirect_to painel_pizzas_path, notice: "Pizza atualizada com sucesso"
		else
			render action: "edit_sabor"
		end
	end

	def destroy_sabor
		@sabor = SaboresDePizza.find(params[:id])

		@sabor.destroy

    	respond_to do |format|
      		format.html { redirect_to painel_pizzas_path, notice: 'Pizza excluida com sucesso.' }
      		format.json { head :no_content }
      	end
	end

	def show_pedido
		@pedido = @pedidos.find(params[:id])
	end

	def encerrar_pedido #ultima ação caso ocorra tudo bem.
		@pedido = Pedido.find(params[:pedido_id])
		@pedido.status = 4 #codigo de pedido encerrado

		if @pedido.save
         UserNotifier.send_pedido_encerrado_email(@pedido).deliver
			redirect_to painel_pedidos_path, notice: "Pedido encerrado com sucesso. O cliente será notificado de que seu pedido saiu para entrega."
		else
			redirect_to painel_pedidos_path, notice: "Ops. Ocorreu algum erro. Tente encerrar o pedido novamente."
		end
	end

   def cancelar_pedido
		@pedido = Pedido.find(params[:pedido_id])
		@pedido.status = 5 #codigo de pedido cancelado pelo restaurante SEM ENTREGA AO CLIENTE

		if @pedido.save

         UserNotifier.send_pedido_cancelado_email(@pedido).deliver

			redirect_to painel_pedidos_path, notice: "Pedido cancelado com sucesso."
		else
			redirect_to painel_pedidos_path, notice: "Ops. Ocorreu algum erro. Tente cancelar o pedido novamente."
		end
	end

	def restaurante #edita informações do restaurante, as mesmas da hora de criar
		@cozinhas = Cozinha.all
	end

	private

	def sabor_params
		params.require(:sabores_de_pizza)
		.permit(:nome, :descricao, :precoP, :precoM, :precoG, :precoGG, :restaurante_id)
	end

	def get_usuario
		@usuario = current_user
	end

	def get_restaurante
		@restaurante = current_user.restaurante
	end

	def get_pedidos
		@pedidos = Pedido.includes(:item_pedidos, :itens, :usuario).where("restaurante_id = ? AND status > ? ", @restaurante.id, 2).order(:status).order(send_at: :desc)
	end

	def get_qtde_pedidos_abertos
		@qtde_pedidos_abertos = @pedidos.where("status = 3").count
	end
end
