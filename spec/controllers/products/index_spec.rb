require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  render_views

  describe "GET index" do
    let!(:products) { create_list(:product, 5) }
    before(:each) do
      get :index, format: :json
    end

    it "should return all products" do
      expect(parsed_body.pluck("id")).to eq(products.map { |product| product.id})
    end

    it 'should return 200 HTTP status' do
      expect(response.status).to eq(200)
    end
  end
end