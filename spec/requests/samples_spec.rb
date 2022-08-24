require 'rails_helper'

RSpec.describe "Samples", type: :request do
  let!(:product) { create(:product) }
  let(:valid_params) do {
    sample: {
      image_data: "image_url",
      product_id: product.id
    }
  } end

  describe "POST /samples" do
    it "successfully creates a sample" do
      post "/products/#{product.id}/samples", params: valid_params
      expect(response).to have_http_status(200)
    end

    it "it fails to create a sample with invalid params" do
      post "/products/#{product.id}/samples", params: {sample: { image_data: "image_url", product_id: ""} }
      expect(JSON.parse(response.body)).to include('unprocessable_entity')
    end

    it "it fails to create a sample with invalid params" do
      post "/products/#{product.id}/samples", params: {sample: {image_data: "", product_id: product.id }}
      expect(JSON.parse(response.body)).to include('unprocessable_entity')
    end
  end

  describe "UPDATE /samples/:id" do
    let!(:product) { create(:product) }
    let(:sample) { Sample.create(image_data:"image_url", product_id: product.id ) }
    it "successfully updates a sample" do
      put "/samples/#{sample.id}", params: valid_params
    expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /samples/:id" do
    let!(:product) { create(:product) }
    let(:sample) { Sample.create(image_data: "image_url", product_id: product.id) }
    it "successfully deletes a sample" do
      delete "/samples/#{sample.id}"
      expect(response).to have_http_status(204)
    end
  end
end