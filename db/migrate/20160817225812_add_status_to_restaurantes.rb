class AddStatusToRestaurantes < ActiveRecord::Migration
  def change
    add_column :restaurantes, :status, :string
  end
end
