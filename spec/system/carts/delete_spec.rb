require 'rails_helper'

RSpec.describe "delete the cart", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'The right scenario' do
    scenario 'delete the cart' do
      the_cart = create(:cart)

      visit cart_path(the_cart)

      click_button "Destroy this cart"

      expect(page).to have_text('Cart was successfully destroyed.')
    end
  end
end
