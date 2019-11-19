class ChangePrecoToItem < ActiveRecord::Migration
  def change
  	change_column :itens, :preco, :integer
  end
end
