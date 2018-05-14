class Order < ApplicationRecord

  monetize :amount_cents

  belongs_to :user
  belongs_to :box
end
