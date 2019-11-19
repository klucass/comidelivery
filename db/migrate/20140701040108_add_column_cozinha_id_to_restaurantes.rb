class AddColumnCozinhaIdToRestaurantes < ActiveRecord::Migration
  def change
    add_column :restaurantes, :cozinha, :integer
  end
end
