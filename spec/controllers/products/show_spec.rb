require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  render_views

  describe "GET show" do
    let!(:product) { create(:product) }

    context 'param is valid' do
      subject { get :show, params: { id: product.id }, format: :json }

      it 'should return the product' do
        subject
        expect(parsed_body["id"]).to eql(product[:id])
      end

      it 'should 200 HTTP status code' do
        subject
        expect(response.status).to eq(200)
      end
    end

    context 'param is invalid' do
      before(:each) do
        get :show, params: { id: rand(2..10) }, format: :json
      end

      it 'should redirect to root_path' do
        expect(response).to redirect_to(root_path)
      end

      it 'should return 302 HTTP status code' do
        expect(response.status).to eq(302)
      end
    end
  end
end