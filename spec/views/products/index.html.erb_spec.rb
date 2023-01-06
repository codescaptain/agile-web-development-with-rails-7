require "rails_helper"

RSpec.describe "products/index", type: :view do
  it "displays all the widgets" do
    assign(:products, [
      Product.create!(title: "slicer", description: "Hello World 1", price: 10.1),
      Product.create!(title: "dicer", description: "Hello World 2", price: 10.1)
    ])

    render

    expect(rendered).to match /slicer/
    expect(rendered).to match /dicer/
  end
end