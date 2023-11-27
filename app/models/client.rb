class Client < ApplicationRecord
  belongs_to :chat, optional: true
  belongs_to :order, optional: true
  validates :nome, :telefone, :email,  presence: true
end
