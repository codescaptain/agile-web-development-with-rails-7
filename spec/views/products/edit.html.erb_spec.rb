require "rails_helper"

RSpec.describe "products/edit", type: :view do
  it "edit page for the product" do
    assign(:product, Product.create(title: 'Hello Title', description: 'Hello World 1', price: 10.1))

    render

    expect(rendered).to have_selector('h1', text: 'Editing product', visible: true)
    expect(rendered).to have_link('Show this product')
    expect(rendered).to have_link('Back to products')
  end
end