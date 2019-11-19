class PizzaRestaurantesController < ApplicationController
	before_action :require_authentication, :require_have_restaurant
	before_action :store_return_to
	before_action :get_restaurante

	def index
		
	end

	def new
		@pizza = PizzaRestaurantes.new		
	end

	def create
		@pizza = current_user.restaurante.pizza_restaurantes.build(pizza_params)

		respond_to do |format|
	    	if @pizza.save        
	        	format.html { redirect_to painel_pizzas_path, notice: "Pizza criada com sucesso."}
	        	format.json { render :show, status: :created, location:  painel_pizzas_path }
	      	else
	        	format.html { render :new }
	        	format.json { render json: @pizza.errors, status: :unprocessable_entity }
	      	end      
  		end
	end

	def update
		@pizza = current_user.restaurante.itens.find(params[:id])

		if @item.update(item_params)
			redirect_to painel_produtos_path, notice: "Produto atualizado com sucesso"
		else
			render action: "edit"
		end
	end

	def edit
		@pizza = PizzaRestaurantes.find(params[:id])
	end

	def destroy
		@pizza = current_user.restaurante.pizza_restaurantes.find(params[:id])
		
		@pizza.destroy

    	respond_to do |format|
      		format.html { redirect_to painel_produtos_path, notice: 'Pizza excluida com sucesso.' }
      		format.json { head :no_content }
      	end
	end

	def get_restaurante
		@restaurante = current_user.restaurante		
	end

	private

	def pizza_params
		params.require(:pizza_restaurantes)
		.permit(:tamanho, :qtde_sabores)
	end

end