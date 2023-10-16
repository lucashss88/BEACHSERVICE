class Order < ApplicationRecord
  belongs_to :item
  # has_many :items, dependent: :destroy
  belongs_to :client
end
