Product.destroy_all
Review.destroy_all
User.destroy_all


admin = User.create!(email: "admin@admin.com", password: "admin1234", password_confirmation: "admin1234", admin: true)

50.times do
  image_category = [ "abstract", "animals", "business", "cats", "city", "food", "nightlife", "fashion", "people", "nature", "sports", "technics", "transport"]

  index = rand(1..10)

  products = Product.create!(name: Faker::Commerce.product_name, cost: Faker::Commerce.price, country_of_origin: Faker::Address.country, image: Faker::LoremPixel.image("200x200", false, image_category[rand(0..image_category.length-1)], index), created_at: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today))

  5.times do
    products.reviews.create!(author: Faker::RickAndMorty.character, content: Faker::Lorem.sentences(4).join(" "), rating: Faker::Number.between(1, 5), created_at: Faker::Date.between(24.days.ago, Date.today))
  end
end

p "Create #{Product.count} products."
p "Create #{Review.count} reviews."
p "Create 1 admin user."
