json.array!(@item_pedidos) do |item_pedido|
  json.extract! item_pedido, :id, :item_id, :pedido_id
  json.url item_pedido_url(item_pedido, format: :json)
end
