require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  render_views

  describe "DELETE destroy" do
    let!(:cart) { create(:cart) }
    context 'param is valid' do
      subject { delete :destroy, params: { id: cart.id } }

      it 'should delete the cart' do
        expect { subject}.to change { Cart.count }.by(-1)
      end

      it 'should redirect to carts_path' do
        subject
        expect(response).to redirect_to(carts_path)
      end

      it 'should 302 HTTP status code' do
        subject
        expect(response.status).to eq(302)
      end
    end

    context 'param is invalid' do
      subject {  delete :destroy, params: { id: rand(20..100)}}

      it 'should redirect to root_path' do
        subject
        expect(response).to redirect_to(store_index_path)
      end

      it 'should return 302 HTTP status code' do
        subject
        expect(response.status).to eq(302)
      end
    end
  end
end