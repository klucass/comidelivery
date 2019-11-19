class Pedido < ActiveRecord::Base
	belongs_to :usuario
	belongs_to :restaurante
	belongs_to :endereco
	belongs_to :metodo
	has_many :itens, through: :item_pedidos
	has_many :item_pedidos
	has_many :pizza_pedidos
	validates_associated :usuario, :restaurante, :endereco, :metodo

	def add_item (item_id)
	current_item = item_pedidos.find_by(item_id: item_id)			
		
		if current_item
			current_item.quantidade += 1
		else
			current_item = item_pedidos.build(item_id: item_id)				
		end
		current_item
	end

	def preco_total
		item_pedidos.to_a.sum { |item| item.preco_total }		
	end


end
