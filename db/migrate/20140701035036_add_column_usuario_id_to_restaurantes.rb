class AddColumnUsuarioIdToRestaurantes < ActiveRecord::Migration
  def change
    add_column :restaurantes, :usuario_id, :integer
  end
end
