class PedidosController < ApplicationController
	include CurrentPedido

	before_action :set_pedido, only: [:show, :edit, :update, :destroy, :checkout]
	before_action :require_authentication, only: [:checkout, :acompanhamento, :update]
	before_action :store_return_to
	rescue_from ActiveRecord::RecordNotFound, with: :pedido_invalido

	def new
		@pedido = Pedido.new
	end

	def create #guardar para a finalização do pedido

	end

	def show
	end

	def checkout # Primeiro botão Finalizar, ainda na tela do restaurante. Os pedidos costumam não ter dono em nosso BD
		@pedido.status = 2
		@usuario = current_user
	end

	def acompanhamento
		@pedidos = current_user.pedidos.where("status > 1").order(id: :desc)

		if @pedidos.empty?
			redirect_to account_path, notice: "Você precisa finalizar seu pedido para acompanhá-lo."
		end

		@usuario = current_user
	end

	def update #quando o cliente clica em Finalizar Pedido, na tela de checkout

		@pedido.status = 3 #altera status para 'finalizado'

		@pedido.usuario_id = current_user.id #atribui um usuário. Nesta fase, o login é obrigatório

		@pedido.send_at = Time.now #atualiza a hora do despacho do pedido. Quando houver pagamento, esta hora deverá ser a mesma da confirmação de pagamento


		if @pedido.update(checkout_params)#se tudo der certo...
         #dispara e-mail para o cliente, o restaurante e para nós mesmos
         UserNotifier.send_novo_pedido_email(@pedido).deliver


			session[:pedido_id] = nil #apaga o 'carrinho de compras do pedido salvo em cache no navegador do cliente'
			redirect_to pedidos_acompanhamento_path, notice: "Pedido finalizado com sucesso"

		else
			render pedido_checkout_path
		end
	end

	def destroy
		@pedido.destroy if @pedido.id == session[:pedido_id] and session[:pedido_id] != nil
		session[:pedido_id] == nil
		respond_to do |format|
			format.html { redirect_to restaurantes_url, notice: 'Seu pedido está vazio'}
			format.json { head :no_content }
		end

	end

	private

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params[:pedido]
    end

    def checkout_params
    	params.require(:pedido)
		.permit(:endereco_id, :id_forma_pagamento, :comentario)

    end

	def pedido_invalido
		logger.error "Tentativa de acesso invalido ao pedido #{params[:id]}"
		redirect_to restaurantes_url, notice: "Pedido inválido"
	end

end
