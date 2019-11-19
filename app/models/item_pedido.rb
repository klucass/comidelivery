class ItemPedido < ActiveRecord::Base
  belongs_to :item
  belongs_to :pedido

  def preco_total
  	item.preco_centavos * quantidade  	
  end
end
