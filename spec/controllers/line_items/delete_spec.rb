require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
  render_views

  describe "DELETE destroy" do
    let!(:line_item) { create(:line_item) }
    context 'param is valid' do
      subject { delete :destroy, params: { id: line_item.id } }

      it 'should delete the line_item' do
        expect { subject}.to change { LineItem.count }.by(-1)
      end

      it 'should redirect to line_items path' do
        subject
        expect(response).to redirect_to(line_items_path)
      end

      it 'should 302 HTTP status code' do
        subject
        expect(response.status).to eq(302)
      end
    end

    context 'param is invalid' do
      subject {  delete :destroy, params: { id: rand(20..100)}}

      it 'should redirect to root_path' do
        subject
        expect(response).to redirect_to(store_index_path)
      end

      it 'should return 302 HTTP status code' do
        subject
        expect(response.status).to eq(302)
      end
    end
  end
end