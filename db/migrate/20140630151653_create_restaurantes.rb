class CreateRestaurantes < ActiveRecord::Migration
  def change
    create_table :restaurantes do |t|
    	t.string :nome
    	t.text :descricao
    	t.timestamps
    end
  end
end
