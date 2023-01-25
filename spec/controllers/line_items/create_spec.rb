require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
  render_views

  let!(:valid_line_item) { attributes_for(:line_item) }

  describe "POST create" do
    context 'params are valid' do
      subject { post :create, params: { product_id: valid_line_item[:product].id, cart_id: valid_line_item[:cart].id
      }, session: { cart_id: valid_line_item[:cart].id } }

      it 'should create a new line_item' do
        expect { subject }.to change { LineItem.count }.by(1)
      end

      it 'should redirect to created line_item' do
        subject
        expect(response).to redirect_to(cart_url(valid_line_item[:cart]))
      end

      it 'should return 302 HTTP status' do
        subject
        expect(response.status).to eq(302)
      end
    end
  end
end