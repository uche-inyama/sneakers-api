require 'rails_helper'

RSpec.describe "Products", type: :request do
  let(:valid_params) do {
    product: {
      name: "Nike air",
      marketing_statement: "Good thinking, good product",
      product_price: 200,
      product_discount: 10
    }
  } end

  let!(:product) { create(:product) }


  describe "GET /products" do
    let!(:products) { create_list(:product, 4)}
    it "successfully returns an array of products" do
      get '/products'
      expect((JSON.parse(response.body)).size).to eq(5)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /products" do
    it "sucessfully creates a product with right params" do
      post '/products', params: valid_params
      expect(response).to have_http_status(200)
    end

    it "fails to create a product when name is empty" do
      post '/products', params: { product: 
        {name: "", marketing_statement: "Good thinking", product_price: 200, product_discount: 20 }}
      expect(JSON.parse(response.body)).to include('unprocessable_entity')
    end

    it "fails to create a product when marketing statement is empty" do
      post '/products', params: { product: 
        {name: "Nike air", marketing_statement: "", product_price: 200, product_discount: 20 }}
      expect(JSON.parse(response.body)).to include('unprocessable_entity')
    end
  end

  describe 'UPDATE /products/:id' do
    it "successfully updates the product" do
      put "/products/#{product.id}", params: valid_params
    end

    it "fails to update if any param is missing" do
      put "/products/#{product.id}", params: { product: {
        name: "Nike air", marketing_statement: "", product_price: 200, product_discount: 20
      }}
      expect(JSON.parse(response.body)).to include('unprocessable_entity')
    end
  end

  describe "DELETE /products/:id" do
    it "successfully deletes a product" do
      delete "/products/#{product.id}"
      expect(response).to have_http_status(204)
    end
  end
end