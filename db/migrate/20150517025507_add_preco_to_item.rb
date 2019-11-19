class AddPrecoToItem < ActiveRecord::Migration
  def change
    change_column :itens, :preco, :decimal
  end
end
