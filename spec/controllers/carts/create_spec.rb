require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  render_views

  let!(:valid_cart) { attributes_for(:cart) }

  describe "POST create" do
    context 'params are valid' do
      subject { post :create, params: { product: valid_cart } }

      it 'should create a new cart' do
        expect { subject}.to change { Cart.count }.by(1)
      end

      it 'should redirect to created product' do
        subject
        expect(response).to redirect_to(cart_path(Cart.last))
      end

      it 'should return 302 HTTP status' do
        subject
        expect(response.status).to eq(302)
      end
    end
  end
end