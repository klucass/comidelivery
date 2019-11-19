class RemovePrecoFromItens < ActiveRecord::Migration
  def change
  	remove_column :itens, :preco
  end
end
