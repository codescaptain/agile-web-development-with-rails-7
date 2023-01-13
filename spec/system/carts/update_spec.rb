require 'rails_helper'

RSpec.describe "edit the cart", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'The right scenario' do
    scenario 'update the cart' do
      the_cart = create(:cart)

      visit edit_cart_path(the_cart)

      click_button "Update Cart"

      expect(page).to have_text('Cart was successfully updated.')
    end
  end
end
