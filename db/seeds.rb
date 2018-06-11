# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative "seeds_table"

Item.destroy_all
Order.destroy_all
Box.destroy_all
Category.destroy_all
User.destroy_all

u = User.new
u.email = "henrik.dittmar@nestim.com"
u.admin = true
u.password = "123456"
u.phone_number = "+4916090613719"
raise unless u.save

ITEMS.each do |item_hash|
  item = Item.new
  item.photo_url = Cloudinary::Uploader.upload("photos/" + item_hash[:photo])
  item.sku = item_hash[:photo].split(".")[0]
  item.price = item_hash[:price]
end

5.times do
  i = Item.new
  i.photo = "https://www.adventskalender.shop/snickers-riegel-50-g"
  i.name = ["Snickers","Mars","Karl Karlo"].sample
  i.sku = i.name.
  i.category = Category.all.sample
  i.price_cents = 50 + rand(100)
  i.save
end

10.times do
  b = Box.new
  b.code = (1000 + rand(8999)).to_s
  b.kind = "5l"
  b.user = u
  while b.items.length < 9 do
    i = Item.all.sample
    b.items << i unless b.items.include?(i)
  end
  b.save
end
