class Item < ApplicationRecord
  # belongs_to :order
  belongs_to :category
  # accepts_nested_attributes_for :category
  enum status: {
      pedido: 0,
      em_preparo: 1,
      pronto: 2
    }
end
