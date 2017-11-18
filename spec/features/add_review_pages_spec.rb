require 'rails_helper'

describe "add reviews process" do
  it "adds a review to product" do
    product = Product.create(name: "Dog Catcher", cost: "45.00", country_of_origin: "Hawii")
    visit product_path(product)
    click_link 'Add review'
    fill_in 'Author', :with => 'Elrey'
    fill_in 'Content', :with => "h" * 55
    fill_in 'Rating', :with => 4
    click_on 'Create Review'
    expect(page).to have_content 'Elrey'
  end

  it "gives error when no author is entered" do
    product = Product.create(name: "Dog Catcher", cost: "45.00", country_of_origin: "Hawii")
    visit product_path(product)
    click_link 'Add review'
    fill_in 'Author', :with => ''
    fill_in 'Content', :with => "h" * 55
    fill_in 'Rating', :with => 4
    click_on 'Create Review'
    expect(page).to have_content 'errors'
  end

  it "gives error when no cost is entered" do
    product = Product.create(name: "Dog Catcher", cost: "45.00", country_of_origin: "Hawii")
    visit product_path(product)
    click_link 'Add review'
    fill_in 'Author', :with => 'Elrey'
    fill_in 'Content', :with => ''
    fill_in 'Rating', :with => 4
    click_on 'Create Review'
    expect(page).to have_content 'errors'
  end

  it "gives error when no rating is entered" do
    product = Product.create(name: "Dog Catcher", cost: "45.00", country_of_origin: "Hawii")
    visit product_path(product)
    click_link 'Add review'
    fill_in 'Author', :with => 'Elrey'
    fill_in 'Content', :with => "h" * 55
    fill_in 'Rating', :with => ''
    click_on 'Create Review'
    expect(page).to have_content 'errors'
  end
end
