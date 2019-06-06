# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

case Rails.env
when "development"
  admin_user = User.create! email:'admin@admin.com', password: 'admin123', password_confirmation: 'admin123', is_admin: true
  test_user = User.create! email:'test@test.com', password: 'test123', password_confirmation: 'test123', is_admin: false
  admin_user.confirm
  test_user.confirm
  Item.create(name: 'Item 1', description: 'Description 1', grams: 10, doges: 1000)
  Item.create(name: 'Item 2', description: 'Description 2', grams: 20, doges: 2000)
  Item.create(name: 'Item 3', description: 'Description 3', grams: 30, doges: 3000)
when "production"
  admin_user = User.create! email:'admin@admin.com', password: 'admin123', password_confirmation: 'admin123', is_admin: true
  test_user = User.create! email:'test@test.com', password: 'test123', password_confirmation: 'test123', is_admin: false
  admin_user.confirm
  test_user.confirm
  Item.create(name: 'Item 1', description: 'Description 1', grams: 10, doges: 1000)
  Item.create(name: 'Item 2', description: 'Description 2', grams: 20, doges: 2000)
  Item.create(name: 'Item 3', description: 'Description 3', grams: 30, doges: 3000)
end

ShippingType.create(name: 'Shipping type 1', doges_per_kilo: 100)
ShippingType.create(name: 'Shipping type 2', doges_per_kilo: 200)
ShippingType.create(name: 'Shipping type 3', doges_per_kilo: 300)

OrderState.create(name: 'Pending')
OrderState.create(name: 'Processing')
OrderState.create(name: 'Shipped')