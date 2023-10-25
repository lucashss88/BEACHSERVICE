class Client < ApplicationRecord
  validates :nome, :telefone, :email,  presence: true
end
