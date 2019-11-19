class CreateBordas < ActiveRecord::Migration
  def change
    create_table :bordas do |t|
      t.string :nome
      t.string :descricao
      t.integer :preco
      t.belongs_to :restaurante, index: true

      t.timestamps
    end
  end
end
