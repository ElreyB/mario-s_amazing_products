require 'rails_helper'

describe "edit review process" do
  it "edits review for product" do
    product = Product.create(name: "Dog Catcher", cost: "45.00", country_of_origin: "Hawii")
    review = Review.create(author: "Elrey", content: "h" * 55, rating: 3, product_id: product.id)
    visit product_path(product)
    click_link 'Edit Review'
    fill_in 'Author', :with => "Elrey!"
    click_on 'Update Review'
    expect(page).to have_content 'Elrey!'
  end
end
