class CreateMetodoRestaurantes < ActiveRecord::Migration
  def change
    create_table :metodo_restaurantes, id: false do |t|
    	t.integer :metodo_id
    	t.integer :restaurante_id
    	t.timestamps
    end
  end
end
