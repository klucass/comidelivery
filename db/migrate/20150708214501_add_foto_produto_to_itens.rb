class AddFotoProdutoToItens < ActiveRecord::Migration
  def change
    add_column :itens, :foto_produto, :string
  end
end
