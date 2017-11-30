require 'rails_helper'

describe Review do
  it { should validate_presence_of :author }
  it { should validate_presence_of :content }
  it { should validate_presence_of :rating }

  context "when given a product_id" do
    it "returns all reviews from product" do
      product1 = Product.create(name: "Cat Catcher", cost: "45.00", country_of_origin: "USA", created_at: (DateTime.now - 7.days))
      product2 = Product.create(name: "Dog Catcher", cost: "45.00", country_of_origin: "France")

      review1 = Review.create(author: "Sam", content: "h" * 55, rating: 3, product_id: product1.id)
      review1 = Review.create(author: "Bob", content: "h" * 55, rating: 3, product_id: product1.id)
      review1 = Review.create(author: "Oscar", content: "h" * 55, rating: 3, product_id: product2.id)

      expect(Review.of_product(product2.id)).to eq [review1]
    end
  end
end
