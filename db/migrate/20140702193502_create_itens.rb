class CreateItens < ActiveRecord::Migration
  def change
    create_table :itens do |t|
    	t.string :nome
    	t.text :descricao
    	t.integer :preco
    	t.string :urlthumbimg
    	t.string :urlimg
    	t.integer :restaurante_id
    	t.integer :categoria_id
    	t.timestamps
    end
  end
end
