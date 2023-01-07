require "rails_helper"

RSpec.describe "rendering locals in a partial", type: :view do
  subject { Nokogiri::HTML(rendered) }

  it "form for editing the product" do
    product = Product.create!(title: "dicer", description: "Hello World 2", price: 10.1)

    render :partial => "products/form", :locals => { :product => product }

    aggregate_failures do
      expect(subject.at('input[@name="product[title]"]')['value']).to eq(product.title)
      expect(subject.at('textarea[@name="product[description]"]').text.strip).to eq(product.description)
      expect(subject.at('input[@name="product[image_url]"]')['value']).to eq(product.image_url)
      expect(subject.at('input[@name="product[price]"]')['value'].to_f).to eq(product.price.to_f)
      expect(rendered).to have_button('Update Product')
    end
  end

  it "form for creating the product" do
    product = Product.new

    render :partial => "products/form", :locals => { :product => product }

    aggregate_failures do
      expect(subject.at('input[@name="product[title]"]')['value']).to eq(nil)
      expect(subject.at('textarea[@name="product[description]"]').text.strip).to eq("")
      expect(subject.at('input[@name="product[image_url]"]')['value']).to eq(nil)
      expect(subject.at('input[@name="product[price]"]')['value']).to eq(nil)
      expect(rendered).to have_button('Create Product')
    end
  end
end