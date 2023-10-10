json.extract! item, :id, :nome, :preco_unitario, :descricao, :quantidade, :categoria, :created_at, :updated_at
json.url item_url(item, format: :json)
