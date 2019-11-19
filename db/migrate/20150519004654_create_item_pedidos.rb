class CreateItemPedidos < ActiveRecord::Migration
  def change
    create_table :item_pedidos do |t|
      t.references :item, index: true
      t.belongs_to :pedido, index: true
      t.text :comentario
      t.integer :quantidade
      t.timestamps
    end
  end
end
