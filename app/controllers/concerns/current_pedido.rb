module CurrentPedido 
	extend ActiveSupport::Concern
	private

	def set_pedido
		@pedido = Pedido.find(session[:pedido_id])

	rescue ActiveRecord::RecordNotFound
		@pedido = Pedido.create
		session[:pedido_id] = @pedido.id		
	end

	def get_pedido #Se o pedido da session não estiver no BD, limpa a session
		@pedido = Pedido.find(session[:pedido_id])
		rescue ActiveRecord::RecordNotFound
		session[:pedido_id] = nil
	end
end