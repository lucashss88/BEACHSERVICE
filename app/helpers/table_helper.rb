module TableHelper
  def listTables
    @clients = Client.all
    @orders = Order.all
    render partial: 'shared/tables', locals: { clients: @clients, orders:@orders}
  end

  def tableNumber
    @number = rand(1...20)
    return @number
  end

  def getOrder(client)
    @orders = Order.all
    @orders.each do |order|
      if order.client.id == client.id
        return order
      end
    end
    return client
  end
end
