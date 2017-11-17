Product.destroy_all
Review.destroy_all

50.times do
  products = Product.create!(name: Faker::Commerce.product_name, cost: Faker::Commerce.price, country_of_origin: Faker::Address.country, created_at: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today))

  5.times do
    products.reviews.create!(author: Faker::RickAndMorty.character, content: Faker::Lorem.sentences(4).join(" "), rating: Faker::Number.between(1, 5), created_at: Faker::Date.between(24.days.ago, Date.today))
  end
end

p "Create #{Product.count} products."
p "Create #{Review.count} reviews."
