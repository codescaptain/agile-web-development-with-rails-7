require "rails_helper"

RSpec.describe "products/show", type: :view do
  it "displays all the widgets" do
    assign(:product, Product.create!(title: 'Hello Title', description: 'Hello World 1', price: 10.1))

    render

    aggregate_failures do
      expect(rendered).to have_selector('p', text: 'Hello Title', visible: true)
      expect(rendered).to have_link('Edit this product')
      expect(rendered).to have_button('Destroy this product')
      expect(rendered).to have_link('Back to products')
    end
  end
end