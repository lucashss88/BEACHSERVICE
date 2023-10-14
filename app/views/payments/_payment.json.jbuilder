json.extract! payment, :id, :forma_pagamento, :valor, :data, :client_id, :order_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
