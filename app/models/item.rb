class Item < ApplicationRecord
  # belongs_to :order
  belongs_to :category
  # accepts_nested_attributes_for :category
end
