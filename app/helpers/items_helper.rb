module ItemsHelper
  # Adicionar item ao pedido
  def adicionar_item(id_cliente, item)

    @orders = Order.all
    @item = item
    @order = @orders.each do|order|
      if order.client.id == id_cliente
        return order
      end
    end
    # Crie uma associação entre o pedido e o item
    @order.items.push(item)

    @order.update(@order)

    redirect_to @order, notice: 'Item adicionado ao pedido com sucesso!'

  end
end
