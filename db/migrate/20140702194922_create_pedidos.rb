class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
    	t.integer :usuario_id
    	t.integer :restaurante_id
    	t.integer :endereco_id
    	t.integer :metodo_id
    	t.integer :cupom_id
    	t.integer :status
    	t.string :comentario
    	t.timestamps
    end
  end
end
