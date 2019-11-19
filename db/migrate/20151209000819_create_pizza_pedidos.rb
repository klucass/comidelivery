class CreatePizzaPedidos < ActiveRecord::Migration
  def change
    create_table :pizza_pedidos do |t|
      t.references :pedidos, index: true
      t.string :tamanho
      t.references :bordas, index: true

      t.timestamps
    end
  end
end
