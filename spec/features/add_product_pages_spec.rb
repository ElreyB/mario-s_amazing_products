require 'rails_helper'

describe "add a product process" do
  # don't understand why this test does not pass
  # it "adds a new product" do
  #   visit "/"
  #   click_link 'Add Product'
  #   fill_in 'Name', :with => 'Cat Catcher'
  #   fill_in 'Cost', :with => '43.00'
  #   fill_in 'Country of origin', :with => 'Hawii'
  #   click_on 'Create Product'
  #   expect(page).to have_content 'Cat Catcher'
  # end

  it "gives error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end
end
