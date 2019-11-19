class AddCozinhaRefToRestaurante < ActiveRecord::Migration
  def change
    add_reference :restaurantes, :cozinha, index: true, foreign_key: true
    remove_column :restaurantes, :cozinha, :integer
  end
end
