require 'rails_helper'

RSpec.describe StoreController, type: :controller do

  let!(:products) { create_list(:product, 5) }
  it 'should return all products' do

    get :index
    aggregate_failures do
      expect(response.status).to eq(200)
      expect(assigns['products'].pluck(:id)).to eq(products.pluck(:id))
    end
  end
end