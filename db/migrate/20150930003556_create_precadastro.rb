class CreatePrecadastro < ActiveRecord::Migration
  def change
    create_table :precadastros do |t|
      t.string :nome
      t.string :email
    end
  end
end
