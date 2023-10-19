class Category < ApplicationRecord
  has_many :items
  # accepts_nested_attributes_for :items, reject_if: :all_blank
end
