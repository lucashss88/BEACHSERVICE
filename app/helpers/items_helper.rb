module ItemsHelper
  # Adicionar item ao pedido

  def adicionar_item(id_cliente, item_quant, item)
    @orders = Order.all
    @item = Item.find(item)
    @orders.each do|order|
      if order.client.id == id_cliente.to_i
        if is_a_number?(item_quant)
          item_quant = item_quant.to_i
          if item_quant > 0
            puts id_cliente
            for i in 1..item_quant do
              order.items.push(@item)
              @order_item = OrderItem.last
              item_values = {
                preco_unitario: @item.preco_unitario,
                item_nome: @item.nome
              }
              @order_item.update(item_values)
            end
          end
        end
      end
    end
  end

  def is_a_number?(str)
    !!(Float(str) rescue false)
  end

end
