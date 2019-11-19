class AddConfirmationFieldsToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :confirmed_at, :datetime
    add_column :usuarios, :confirmation_token, :string
  end
end
