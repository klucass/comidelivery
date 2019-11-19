class CreatePizzaRestaurantes < ActiveRecord::Migration
  def change
    create_table :pizza_restaurantes do |t|
      t.string :tamanho
      t.integer :qtde_sabores
      t.belongs_to :id_restaurante, :restaurante, index: true

      t.timestamps
    end
  end
end
