require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
  render_views

  let!(:line_item) { create(:line_item) }
  let!(:valid_line_item) { attributes_for(:line_item) }
  describe "PUT update" do
    context 'params are valid' do
      subject { put :update, params: { line_item: valid_line_item, id: line_item.id } }

      it 'should update to the line_item' do
        subject
        #expect(line_item.reload["updated_at"]).to eq(valid_line_item[:updated_at])
      end

      it 'should redirect to the line_item show page' do
        subject
        expect(response).to redirect_to(line_item_path(line_item.id))
      end

      it 'should return 302 HTTP status' do
        subject
        expect(response.status).to eq(302)
      end
    end
  end
end