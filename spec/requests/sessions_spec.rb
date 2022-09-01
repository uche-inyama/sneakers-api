require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let!(:user) { create(:user) }
  describe "POST /users/sign_in" do
    it "successfully signs a user in with the right credentials" do
      post '/users/sign_in', params: {  email: user.email, password: user.password }

      expect(response).to have_http_status(200)
    end

    it "fails to sign in a user with incorrect credentials" do
      post '/users/sign_in', params: { email: "", password: user.password }

      expect(JSON.parse(response.body)).to include({ "error"=> "unauthorized" }) 
    end
  end

  describe "delete /users/sign_out" do
    it "successfully signs out a user" do
      delete destroy_user_session_path 
      
      expect(response).to have_http_status(302)
    end
  end
end
