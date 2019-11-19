class AddUsuarioRefToRestaurante < ActiveRecord::Migration
  def change
    add_reference :restaurantes, :usuario, index: true
  end
end
