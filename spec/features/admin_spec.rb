require 'rails_helper'

RSpec.feature "Admins", type: :feature do
  let!(:admin) { create(:admin) }
  describe "Registration" do
    it "successfully creates an admin" do
      visit new_admin_registration_path
      expect(page).to have_content('Sign up')
      fill_in 'admin[email]', with: 'johndoe@gmail.com'
      fill_in 'admin[password]', with: 'password'
      fill_in 'admin[password_confirmation]', with: 'password'
      click_on "Sign up"
      expect(current_path).to eq(products_path)
    end

    it "successfully signs in & signs out" do
      sign_in admin
      visit products_path
      expect(page).to have_content('sign out')

      sign_out admin
      visit unauthenticated_root_path
      expect(page).to have_content('sign in')
    end
  end
end
