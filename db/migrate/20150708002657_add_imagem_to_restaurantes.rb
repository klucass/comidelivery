class AddImagemToRestaurantes < ActiveRecord::Migration
  def change
    add_column :restaurantes, :imagem, :string
  end
end
