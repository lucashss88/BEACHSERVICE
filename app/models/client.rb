class Client < ApplicationRecord
  belongs_to :chat
  belongs_to :order
  validates :nome, :telefone, :email,  presence: true
end
