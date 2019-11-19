class ChangeStatusToPedidos < ActiveRecord::Migration
  def change
  	change_column_null :pedidos, :status, false
	change_column_default :pedidos, :status, 0
  end
end
