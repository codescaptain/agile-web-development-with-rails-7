# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :integer          not null
#  product_id :integer          not null
#
# Indexes
#
#  index_line_items_on_cart_id     (cart_id)
#  index_line_items_on_product_id  (product_id)
#
# Foreign Keys
#
#  cart_id     (cart_id => carts.id)
#  product_id  (product_id => products.id)
#
require 'rails_helper'

RSpec.describe LineItem, type: :model do
  let!(:line_item) { create(:line_item) }

  describe 'database' do
    describe 'columns' do
      it { should have_db_column('cart_id'.to_sym).of_type(:integer) }
      it { should have_db_column('product_id'.to_sym).of_type(:integer) }
    end

    describe 'indexes' do
      it { should have_db_index(:cart_id) }
      it { should have_db_index(:product_id) }
    end
  end

  describe 'associations' do
    it { should belong_to(:product) }
    it { should belong_to(:cart) }
  end

  it 'should have valid factory' do
    expect(build(:line_item)).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:cart_id) }
    it { should validate_presence_of(:product_id) }
  end
end
