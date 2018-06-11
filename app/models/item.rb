class Item < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  has_and_belongs_to_many :boxes
  belongs_to :category
  monetize :price_cents
end
