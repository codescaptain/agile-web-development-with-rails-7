require "rails_helper"

RSpec.describe "rendering locals in a partial" do
  it "displays the product" do
    product = Product.create!(title: "dicer", description: "Hello World 2", price: 10.1)

    render :partial => "products/product", :locals => {:product => product}

    expect(rendered).to match /Hello World 2/
    expect(rendered).to match /dicer/
    expect(rendered).to match /10.1/

    expect(rendered).to have_link('Edit this product')
  end
end