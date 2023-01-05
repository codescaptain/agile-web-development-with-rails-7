require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  render_views

  let!(:product) { create(:product) }
  let!(:valid_product_params) { attributes_for(:product) }
  describe "PUT update" do
    context 'params are valid' do
      subject { put :update, params: { product: valid_product_params, id: product.id } }

      it 'should update to product' do
        subject
        expect(product.reload["title"]).to eq(valid_product_params[:title])
      end

      it 'should redirect to the product show page' do
        subject
        expect(response).to redirect_to(product_path(product.id))
      end

      it 'should return 302 HTTP status' do
        subject
        expect(response.status).to eq(302)
      end
    end
  end
end