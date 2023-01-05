require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  render_views

  let!(:valid_product_params) { attributes_for(:product) }
  let!(:invalid_product_params) { attributes_for(:product, title: "") }
  describe "POST create" do
    context 'params are valid' do
      subject { post :create, params: { product: valid_product_params } }

      it 'should create a new product' do
        expect { subject}.to change { Product.count }.by(1)
      end

      it 'should redirect to created product' do
        subject
        expect(response).to redirect_to(product_path(Product.last))
      end

      it 'should return 302 HTTP status' do
        subject
        expect(response.status).to eq(302)
      end
    end

    context 'params are invalid' do
      subject { post :create, params: { product: invalid_product_params} }

      it 'should create a new product' do
        expect { subject}.to change { Product.count }.by(0)
      end


      it 'should return 302 HTTP status' do
        subject
        expect(response.status).to eq(422)
      end
    end
  end
end