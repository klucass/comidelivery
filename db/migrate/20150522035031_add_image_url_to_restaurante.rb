class AddImageUrlToRestaurante < ActiveRecord::Migration
  def change
  	add_column :restaurantes, :img_url, :string
  end
end
