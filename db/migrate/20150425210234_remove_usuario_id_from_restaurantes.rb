class RemoveUsuarioIdFromRestaurantes < ActiveRecord::Migration
  def change
    remove_column :restaurantes, :usuario_id, :integer
  end
end
