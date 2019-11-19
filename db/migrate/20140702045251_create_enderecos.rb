class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
    	t.string :nome
    	t.string :estado
    	t.string :cidade
    	t.string :logradouro
    	t.string :endereco
    	t.string :numero
    	t.string :cep
    	t.string :ponto_referencia
    	t.integer :usuario_id
    	t.integer :restaurante_id
    	t.timestamps
    end
  end
end
