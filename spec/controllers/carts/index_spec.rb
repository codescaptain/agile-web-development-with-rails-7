require 'rails_helper'

RSpec.describe CartsController, type: :controller do

  let!(:carts) { create_list(:cart, 5) }
  it 'should return all products' do

    get :index
    aggregate_failures do
      expect(response.status).to eq(200)
      expect(assigns['carts'].pluck(:id)).to eq(carts.pluck(:id))
    end
  end
end