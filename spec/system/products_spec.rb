require 'rails_helper'

RSpec.describe "Products", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'loads the show page with the product title' do
    product = create(:product, title: "Hello World")

    visit product_path(product)

    expect(page).to have_content("Hello World")
    expect(page).to have_content(product.description)
  end

  it 'loads new product page and create a new product' do
    new_product = attributes_for(:product)

    visit new_product_path

    fill_in 'Title', with: new_product[:title]
    fill_in 'Description', with: new_product[:description]
    fill_in 'Price', with: new_product[:price]
    click_button "Create Product"

    expect(page).to have_text('Product was successfully created.')
  end
end
