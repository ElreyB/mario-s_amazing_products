require 'rails_helper'

describe "delete review process" do
  it "deletes review from product" do
    product = Product.create(name: "Dog Catcher", cost: "45.00", country_of_origin: "Hawii")
    review = Review.create(author: "Elrey", content: "h" * 55, rating: 3, product_id: product.id)
    visit product_path(product)
    click_link 'Delete Review'
    expect(page).not_to have_content 'Elrey'
  end
end
