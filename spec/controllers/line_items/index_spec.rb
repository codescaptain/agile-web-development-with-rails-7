require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do

  let!(:line_items) { create_list(:line_item, 5) }
  it 'should return all line items' do
    get :index
    aggregate_failures do
      expect(response.status).to eq(200)
      expect(assigns['line_items'].pluck(:id)).to eq(line_items.pluck(:id))
    end
  end
end