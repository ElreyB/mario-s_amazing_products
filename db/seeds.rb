Product.destroy_all

50.times do
  Product.create!(name: Faker::Commerce.product_name, cost: Faker::Commerce.price, country_of_origin: Faker::Address.country)
end

p "Create #{Product.count} products."
