class Client < ApplicationRecord
  validates :nome, presence: true
end
