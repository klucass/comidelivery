class CreateSaboresDePizzas < ActiveRecord::Migration
  def change
    create_table :sabores_de_pizzas do |t|
      t.string :nome
      t.string :descricao
      t.integer :precoP
      t.integer :precoM
      t.integer :precoG
      t.integer :precoGG
      t.belongs_to :restaurante

      t.timestamps
    end
  end
end
