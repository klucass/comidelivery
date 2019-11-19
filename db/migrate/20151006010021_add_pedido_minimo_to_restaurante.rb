class AddPedidoMinimoToRestaurante < ActiveRecord::Migration
  def change
    add_column :restaurantes, :pedido_minimo, :integer
  end
end
