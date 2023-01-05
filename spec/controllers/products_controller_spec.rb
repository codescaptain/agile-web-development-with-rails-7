require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  render_views

  describe "GET index" do
    let!(:products) { create_list(:product, 5) }
    it "should return all products" do
      get :index, format: :json
      products.map { |product| product.id}
      expect(parsed_body.pluck("id")).to eq(products.map { |product| product.id})
    end
  end
end