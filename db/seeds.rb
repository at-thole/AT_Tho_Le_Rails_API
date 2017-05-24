# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create! username: "lvtho", email: "lvtho129@gmail.com", password: "123123",
  password_confirmation: "123123", phone: "012345678", address: "123 abc",
  auth_token: SecureRandom.hex

(1..4).each do |x|
  Article.create! title: "Title", description: "description#{x}", content: "Content content", user_id: 1
end

(1..5).each do |x|
  Category.create! name: "Category #{x}"
end
