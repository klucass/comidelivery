class AddQuantidadeToItemPedidos < ActiveRecord::Migration
  def change
  	change_column :item_pedidos, :quantidade, :integer, default: 1
  end
end
