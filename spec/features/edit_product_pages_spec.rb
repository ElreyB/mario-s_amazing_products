require 'rails_helper'
describe "edit a product process" do


  it "edit a product" do
    product = Product.create(name: "Dog Catcher", cost: "45.00", country_of_origin: "Hawii")
    visit product_path(product)
    click_link 'Edit Product'
    fill_in 'Name', :with => 'Cat Catcher'
    fill_in 'Cost', :with => '43.00'
    fill_in 'Country of origin', :with => 'Hawii'
    click_on 'Update Product'
    expect(page).to have_content 'Cat Catcher'
  end

  it "gives error when no name is entered" do
    product = Product.create(name: "Dog Catcher", cost: "45.00", country_of_origin: "Hawii")
    visit product_path(product)
    click_link 'Edit Product'
    fill_in 'Name', :with => ' '
    click_on 'Update Product'
    expect(page).to have_content 'errors'
  end
end
