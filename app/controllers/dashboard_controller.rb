class DashboardController < ApplicationController
	before_action :require_authentication, :administrator
	before_action :store_return_to

	def index
		@restaurantes = Restaurante.all
		@usuarios = Usuario.all

	end

	def pedidos
		@pedidos = Pedido.includes(:item_pedidos, :itens, :usuario).where("status > 2 ").order(:status).order(send_at: :desc)
	end

	def show_pedido
		@pedido = Pedido.find(params[:id])
	end

   def precadastro
      @precadastrados = Precadastro.all
   end

   def edit
      @restaurante = Restaurante.find(params[:id])
      @cozinhas = Cozinha.all
   end

   def update
      @restaurante = Restaurante.find(params[:id])
		if @restaurante.update(restaurante_params)
			redirect_to  dashboard_path, notice: "Dados do restaurante atualizados com sucesso!"
		else
			render action: "edit"
		end
   end

	private

   def restaurante_params
		params.require(:restaurante).permit(:nome, :descricao, :cozinha_id, :pedido_minimo_centavos, :hora_inicio, :hora_fim, :imagem, :status, :email, :metodo_pagamento)
	end

	def administrator
		unless current_user.email == "admin@comidelivery.com"
			redirect_to root_path, notice: "Você não tem acesso para entrar nessa página"
		end
	end
end
