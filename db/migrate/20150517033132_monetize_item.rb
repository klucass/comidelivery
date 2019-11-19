class MonetizeItem < ActiveRecord::Migration
  def change
  	add_money :itens, :preco
  end
end
