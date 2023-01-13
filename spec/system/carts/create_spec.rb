require 'rails_helper'

RSpec.describe "create a cart", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'The right scenario' do
    scenario 'create a new cart' do
      new_cart = attributes_for(:cart)

      visit new_cart_path

      click_button "Create Cart"

      expect(page).to have_text('Cart was successfully created.')
    end
  end
end
