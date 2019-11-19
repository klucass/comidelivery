class AddMetodoPagamentoToRestaurantes < ActiveRecord::Migration
  def change
    add_column :restaurantes, :metodo_pagamento, :string
  end
end
