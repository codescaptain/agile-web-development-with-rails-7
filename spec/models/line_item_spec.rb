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
  pending "add some examples to (or delete) #{__FILE__}"
end
