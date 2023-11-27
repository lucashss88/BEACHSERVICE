class Item < ApplicationRecord
  has_many :order_items
  has_many :orders,  through: :order_items
  belongs_to :category
  # accepts_nested_attributes_for :category
end
