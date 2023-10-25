class Order < ApplicationRecord
  has_many :item
  # has_many :items, dependent: :destroy
  belongs_to :client
end
