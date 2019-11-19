class CreateCozinhas < ActiveRecord::Migration
  def change
    create_table :cozinhas do |t|
    	t.string :nome
    	t.text :descricao
    	t.timestamps
    end
  end
end
