class AddColumnTelefoneToUsuarios < ActiveRecord::Migration
  def change
  	add_column :usuarios, :telefone, :string
  end
end
