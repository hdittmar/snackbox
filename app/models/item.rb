class Item < ApplicationRecord
  has_and_belongs_to_many :boxes
  belongs_to :category
  monetize :price_cents
end
