class RestaurantesController < ApplicationController
	include CurrentPedido
	include TimeOperations

	before_action :require_authentication, only: [:new, :edit, :create, :update, :destroy]
	before_action :store_return_to
	before_action :get_pedido, only: [:show, :edit, :update, :destroy]

	def index
      #Lista somente restaurantes ativos
		@restaurantes = Restaurante.where(status: 'ATIVO')
	end

	def busca

	end

	def show
		@restaurante = Restaurante.find(params[:id])
		@cardapio = Item.where(restaurante_id: params[:id]).order(:categoria_id)
		@categorias = Categoria.all
		@pedido_iniciado_neste_restaurante = if !@pedido.nil? && @pedido.restaurante.try(:id) == @restaurante.id
			true
		else
			false
		end
		#@aberto = aberto?
		@hora_agora = date_to_time(Time.now)
		@pedido_minimo = @restaurante.pedido_minimo_centavos
	end



	def new
		if current_user.restaurante
			@restaurante = current_user.restaurante
			redirect_to @restaurante, notice: 'Você já tem um restaurante.'
		end
		@restaurante = Restaurante.new
		@cozinhas = Cozinha.all
	end

	def edit
		@restaurante = current_user.restaurante
	end
	def update
		@restaurante = current_user.restaurante
		if @restaurante.update(restaurante_params)
			redirect_to painel_path, notice: "Dados do restaurante atualizados com sucesso!"
		else
			render action: "edit"
		end
	end

	def create


		@restaurante = current_user.build_restaurante(restaurante_params)

		if @restaurante.save
			redirect_to painel_path, notice: t('flash.notice.restaurante_created')
		else
			redirect_to new_restaurante_path, notice: "Não deu certo :("
		end
	end

	def destroy
		@restaurante = current_user.restaurantes.find(params[:id])
		@restaurante.destroy

		redirect_to restautantes_url
	end

	private

	def restaurante_params
		params.require(:restaurante).permit(:nome, :descricao, :cozinha_id, :pedido_minimo_centavos, :hora_inicio, :hora_fim, :imagem, :metodo_pagamento)
	end

	def aberto?
		@restaurante = Restaurante.find(params[:id])

		if time_to_minutos(Time.now) > time_to_minutos(@restaurante.hora_fim)
			false
		else
			true
		end

	end
end
