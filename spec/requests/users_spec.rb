require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:valid_params) do {
    user: {
      email: "johnDoe@gmail.com",
      username: "johndoe",
      password: "password",
      password_confirmation: "password"
    }
  } end

  describe "POST /users" do
    it "creates a user successfully" do
      post '/users', params: valid_params
      expect(response).to have_http_status(200)
    end

    it "fails to create a user when the email attribute is empty" do
      post '/users', params: { user:
        {email: "", username: "johndoe", password: "password", password_confirmation: "password"}}
      expect(JSON.parse(response.body)).to include('unprocessable_entity')
    end

    it "fails to create a user when the username attribute is empty" do
      post '/users', params: { user:
        {email: "johndoe@gmail.com", username: "", password: "password", password_confirmation: "password"}}
      expect(JSON.parse(response.body)).to include("unprocessable_entity")
    end

    it "fails to create a user when the password attribute is empty" do
      post '/users', params: { user:
        {email: "johndoe@gmail.com", username: "johndoe", password: "", password_confirmation: "password"}}
      expect(JSON.parse(response.body)).to include("unprocessable_entity")
    end

    it "fails to create a user when the password_confirmation attribute is empty" do
      post '/users', params: { user:
        {email: "johndoe@gmail.com", username: "", password: "password", password_confirmation: "password"}}
      expect(JSON.parse(response.body)).to include("unprocessable_entity")
    end
  end
end
