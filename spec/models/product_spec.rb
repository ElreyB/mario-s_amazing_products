require 'rails_helper'

describe Product do

  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }

  it 'return false when name is not presence' do
      product1 = Product.new(cost: "45.00", country_of_origin: "USA")
      expect(product1.save).to eq false
  end

  it 'return false when cost is not presence' do
      product1 = Product.new(name: "Cat Catcher", country_of_origin: "USA")
      expect(product1.save).to eq false
  end

  it 'return false when country of origin is not presence' do
      product1 = Product.new(cost: "45.00", name: "Cat Catcher")
      expect(product1.save).to eq false
  end

  it 'return products made in the USA' do
    product1 = Product.create(name: "Cat Clippers", cost: "45.00", country_of_origin: "USA")
    product2 = Product.create(name: "Dog Catcher", cost: "45.00", country_of_origin: "France")
    product3 = Product.create(name: "Cat Sleeper", cost: "45.00", country_of_origin: "USA")
    expect(Product.usa_products).to eq [product1, product3]
  end

  it 'returns three most recent products' do
    product1 = Product.create(name: "Cat Catcher", cost: "45.00", country_of_origin: "USA", created_at: (DateTime.now - 7.days))
    product2 = Product.create(name: "Dog Catcher", cost: "45.00", country_of_origin: "France")
    product3 = Product.create(name: "Cat Sleeper", cost: "45.00", country_of_origin: "USA")
    product4 = Product.create(name: "Cat Nail Cutter", cost: "45.00", country_of_origin: "USA", created_at: (DateTime.now - 7.days))
    product5 = Product.create(name: "Cat Brush", cost: "45.00", country_of_origin: "USA")
    expect(Product.three_recent_products).to eq [product5, product3, product2]
  end

  it "returns most reviewed product" do
    product1 = Product.create(name: "Cat Catcher", cost: "45.00", country_of_origin: "USA", created_at: (DateTime.now - 7.days))
    product2 = Product.create(name: "Dog Catcher", cost: "45.00", country_of_origin: "France")

    review1 = Review.create(author: "Sam", content: "h" * 55, rating: 3, product_id: product1.id)
    review1 = Review.create(author: "Sam", content: "h" * 55, rating: 3, product_id: product1.id)
    review1 = Review.create(author: "Sam", content: "h" * 55, rating: 3, product_id: product2.id)

    expect(Product.most_reviewed_product).to eq product1
  end

end
