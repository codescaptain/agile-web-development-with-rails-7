require 'rails_helper'

RSpec.describe "update the product", type: :system do
  before do
    driven_by(:rack_test)
  end
  describe 'Worst case scenario' do
    scenario 'empty title, description and price' do
      the_product = create(:product)

      visit product_path(the_product)
      click_link "Edit this product"
      fill_in 'Title', with: ""
      fill_in 'Description', with: ""
      fill_in 'Price', with: ""
      click_button "Update Product"

      aggregate_failures do
        expect(page).to have_content("Title can't be blank")
        expect(page).to have_content("Description can't be blank")
        expect(page).to have_content("Price is not a number")
      end
    end

    scenario 'image_url has a invalid format' do
      the_product = create(:product)

      visit product_path(the_product)
      click_link "Edit this product"
      fill_in 'Title', with: the_product[:title]
      fill_in 'Description', with: the_product[:description]
      fill_in 'Price', with: the_product[:price]
      fill_in 'Image url', with: 'example.cvb'
      click_button "Update Product"

      expect(page).to have_content("Image url must be a URL for GIF, JPG or PNG image.")
    end

    scenario 'title is not unique' do
      a_new_product = create(:product)
      the_product = create(:product)

      visit product_path(the_product)
      click_link "Edit this product"
      fill_in 'Title', with: a_new_product[:title]
      fill_in 'Description', with: the_product[:description]
      fill_in 'Price', with: the_product[:price]
      click_button "Update Product"

      expect(page).to have_content('Title has already been taken')
    end
  end

  describe 'The right scenario' do
    scenario 'updated the product' do
      the_product = create(:product)

      visit product_path(the_product)

      click_link "Edit this product"
      fill_in 'Title', with: 'Changed The Product Title'
      fill_in 'Description', with: the_product[:description]
      fill_in 'Price', with: the_product[:price]
      click_button "Update Product"

      expect(page).to have_selector('p', text: 'Changed The Product Title', visible: true)
      expect(page).to have_content("Product was successfully updated.")
    end
  end
end