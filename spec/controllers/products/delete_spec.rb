require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  render_views

  describe "DELETE destroy" do
    let!(:product) { create(:product) }
    context 'param is valid' do
      subject { delete :destroy, params: { id: product.id } }

      it 'should delete the product' do
        expect { subject}.to change { Product.count }.by(-1)
      end

      it 'should redirect to products_path' do
        subject
        expect(response).to redirect_to(products_path)
      end

      it 'should 302 HTTP status code' do
        subject
        expect(response.status).to eq(302)
      end
    end

    context 'param is invalid' do
      subject {  delete :destroy, params: { id: rand(20..100)}, format: :json}

      it 'should redirect to root_path' do
        subject
        expect(response).to redirect_to(root_path)
      end

      it 'should return 302 HTTP status code' do
        subject
        expect(response.status).to eq(302)
      end
    end
  end
end