class AddTelefoneToPrecadastro < ActiveRecord::Migration
  def change
    add_column :precadastros, :telefone, :string
  end
end
