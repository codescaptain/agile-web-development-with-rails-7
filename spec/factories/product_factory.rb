FactoryBot.define do
  factory :product do
    sequence(:title) { |n| "Product title #{n}"}
    sequence(:description) { |n| "Product Description #{n}"}
    price {10.1}
  end
end