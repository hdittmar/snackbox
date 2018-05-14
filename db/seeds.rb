# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all
Order.destroy_all
Box.destroy_all
Category.destroy_all
User.destroy_all

u = User.new
u.email = "henrik.dittmar@nestim.com"
u.admin = true
u.password = "123456"
raise unless u.save

Category.create!(name: "Chocolate")
Category.create!(name: "Cookie")
Category.create!(name: "Drink")

5.times do
  i = Item.new
  i.photo_url = "https://www.adventskalender.shop/snickers-riegel-50-g"
  i.name = ["Snickers","Mars","Karl Karlo"].sample
  i.category = Category.all.sample
  i.price_cents = 50 + rand(100)
  i.save
end

3.times do
  b = Box.new
  b.code = (1000 + rand(8999)).to_s
  b.kind = "5l"
  b.user = u
  b.items << Item.all.sample
  b.items << Item.all.sample
  b.save
end
