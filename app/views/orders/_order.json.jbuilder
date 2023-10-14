json.extract! order, :id, :valor_total, :status, :numero_mesa, :item_id, :client_id, :created_at, :updated_at
json.url order_url(order, format: :json)
