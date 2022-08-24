require 'rails_helper'

RSpec.describe "Admins", type: :request do
  describe "POST /admins" do
    let!(:valid_params) do {
      admin: {
        email: 'johndoe@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      }
    } end

    let!(:invalid_params) do {
      admin: {
        email: "",
        password: "password",
        password_confirmation: "password"
      }
    } end
    
    it "successfully creates an admin" do
      post admin_registration_path, params: valid_params
      expect(response).to have_http_status(200)
    end

    it "fails to create an admin, with invalid params" do
      post admin_registration_path, params: invalid_params
      expect(JSON.parse(response.body)).to include('unprocessable_entity')
    end
  end
end
