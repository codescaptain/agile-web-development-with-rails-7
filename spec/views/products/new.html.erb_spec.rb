require "rails_helper"

RSpec.describe "products/new", type: :view do
  it "a new product page" do
    assign(:product, Product.new(title: 'Hello Title', description: 'Hello World 1', price: 10.1))

    render

    expect(rendered).to have_selector('h1', text: 'New product', visible: true)
    expect(rendered).to have_link('Back to products')
  end
end