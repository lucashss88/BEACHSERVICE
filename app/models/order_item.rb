class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum status: {
      pedido: 0,
      em_preparo: 1,
      pronto: 2,
      cancelado: 3
    }
end
