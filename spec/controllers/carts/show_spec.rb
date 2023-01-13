require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  render_views

  describe "GET show" do
    let!(:cart) { create(:cart) }

    context 'param is valid' do
      subject { get :show, params: { id: cart.id }}

      it 'should return the cart' do
        subject
        expect(assigns['cart'].id).to eq(cart.id)
      end

      it 'should 200 HTTP status code' do
        subject
        expect(response.status).to eq(200)
      end
    end

    context 'param is invalid' do
      before(:each) do
        get :show, params: { id: rand(2..10) }
      end

      it 'should redirect to root_path' do
        expect(response).to redirect_to(store_index_path)
      end

      it 'should return 302 HTTP status code' do
        expect(response.status).to eq(302)
      end
    end
  end
end