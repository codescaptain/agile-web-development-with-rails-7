require "rails_helper"

RSpec.describe "products/index", type: :view do
  it "displays all the widgets" do
    assign(:products, [
      Product.create!(title: "Hello Title", description: "Hello World 1", price: 10.1),
      Product.create!(title: "Goodbye Title", description: "Hello World 2", price: 10.1)
    ])

    render
    aggregate_failures do
      expect(rendered).to match /Hello Title/
      expect(rendered).to match /Goodbye Title/
      expect(rendered).to have_link("Show")
      expect(rendered).to have_link("Edit")
      expect(rendered).to have_link("Destroy")
    end
  end
end