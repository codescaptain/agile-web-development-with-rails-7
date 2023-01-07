require 'rails_helper'

RSpec.describe "create a product", type: :system do
  before do
    driven_by(:rack_test)
  end
  describe 'Worst case scenario' do
    scenario 'empty title, description and price' do
      visit new_product_path
      click_button 'Create Product'

      aggregate_failures do
        expect(page).to have_content("Title can't be blank")
        expect(page).to have_content("Description can't be blank")
        expect(page).to have_content("Price is not a number")
        expect(Product.count).to eq(0)
      end
    end

    scenario 'image_url has a invalid format' do
      new_product = attributes_for(:product)

      visit new_product_path

      fill_in 'Title', with: new_product[:title]
      fill_in 'Description', with: new_product[:description]
      fill_in 'Price', with: new_product[:price]
      fill_in 'Image url', with: 'example.cvb'
      click_button "Create Product"

      expect(page).to have_content("Image url must be a URL for GIF, JPG or PNG image.")

    end

    scenario 'title is not unique' do
      new_product = create(:product)
      duplicate_product = attributes_for(:product, title: new_product.title)
      visit new_product_path

      fill_in 'Title', with: duplicate_product[:title]
      fill_in 'Description', with: duplicate_product[:description]
      fill_in 'Price', with: duplicate_product[:price]
      click_button "Create Product"

      expect(page).to have_content('Title has already been taken')

    end
  end

  describe 'The right scenario' do
    scenario 'create a new product' do
      new_product = attributes_for(:product)

      visit new_product_path

      fill_in 'Title', with: new_product[:title]
      fill_in 'Description', with: new_product[:description]
      fill_in 'Price', with: new_product[:price]
      click_button "Create Product"

      expect(page).to have_text('Product was successfully created.')
    end
  end
end