require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  render_views

  let!(:cart) { create(:cart) }
  let!(:valid_cart_params) { attributes_for(:cart) }

  describe "PUT cart" do
    context 'params are valid' do
      subject { put :update, params: { cart: valid_cart_params, id: cart.id } }

      # it 'should update the cart' do
      #   subject
      #   expect(cart.reload["title"]).to eq(valid_cart_params[:title])
      # end

      it 'should redirect to the product show page' do
        subject
        expect(response).to redirect_to(cart_path(cart.id))
      end

      it 'should return 302 HTTP status' do
        subject
        expect(response.status).to eq(302)
      end
    end
  end
end