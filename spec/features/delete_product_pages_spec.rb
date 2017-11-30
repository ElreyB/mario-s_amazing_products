require 'rails_helper'

describe "delete a product process" do
  it "removes product from page" do
    product = Product.create(name: "Snow Catcher", cost: "45.00", country_of_origin: "USA")
    visit product_path(product)
    click_link 'Delete Product'
    expect(page).not_to have_content 'Snow Catcher'
  end
end
