class AddComplementosToRestaurante < ActiveRecord::Migration
  def change
  	add_money :restaurantes, :pedido_minimo
  	add_money :restaurantes, :taxa_entrega
  	add_column :restaurantes, :hora_inicio, :datetime
  	add_column :restaurantes, :hora_fim, :datetime
  end
end
