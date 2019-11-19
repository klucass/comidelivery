class RemovePasswordFromUsuarios < ActiveRecord::Migration
  def up
  	remove_column :usuarios, :password
  end
end
