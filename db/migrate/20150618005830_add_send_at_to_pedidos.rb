class AddSendAtToPedidos < ActiveRecord::Migration
  def change
  	add_column :pedidos, :send_at, :datetime
  end
end
