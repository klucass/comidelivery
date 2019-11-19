class CreateMetodos < ActiveRecord::Migration
  def change
    create_table :metodos do |t|
    	t.string :nome
    	t.string :descricao
    	t.timestamps
    end
  end
end
