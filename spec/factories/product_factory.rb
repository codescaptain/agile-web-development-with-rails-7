# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  description :text
#  image_url   :string
#  price       :decimal(, )
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :product do
    sequence(:title) { |n| "Product title #{n}"}
    sequence(:description) { |n| "Product Description #{n}"}
    price {10.1}
  end
end
