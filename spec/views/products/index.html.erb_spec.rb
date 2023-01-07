require "rails_helper"

RSpec.describe "products/index", type: :view do
  it "displays all the widgets" do
    assign(:products, [
      Product.create!(title: "Hello Title", description: "Hello World 1", price: 10.1),
      Product.create!(title: "Goodbye Title", description: "Hello World 2", price: 10.1)
    ])

    render

    expect(rendered).to match /Hello Title/
    expect(rendered).to match /Goodbye Title/
  end
end