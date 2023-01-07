require 'rails_helper'

RSpec.describe "delete the product", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'The right scenario' do
    scenario 'updated the product' do
      the_product = create(:product)

      visit product_path(the_product)
      click_button "Destroy this product"

      expect(page).to have_content("Product was successfully destroyed.")
    end
  end
end