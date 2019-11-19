class CreatePizzaSabores < ActiveRecord::Migration
  def change
    create_table :pizza_sabores do |t|
      t.references :pizza_pedidos, index: true
      t.references :sabores_de_pizza, index: true

      t.timestamps
    end
  end
end
