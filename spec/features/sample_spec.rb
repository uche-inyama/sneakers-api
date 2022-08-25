require 'rails_helper'

RSpec.feature "Samples", type: :feature do
  describe "create" do
    let(:admin) { create(:admin) }
    it "successfully creates a sample" do
      sign_in admin
      visit products_path
      create_product
      expect(current_path).to eq(products_path)
      click_on 'Add samples'
      expect(page).to have_content('Add Samples')
      page.attach_file("sample[image_data]", Rails.root + 'app/assets/images/revolt.jpg')
      click_on "Create Sample"
      expect(page).to have_content('sample successfully created.')
    end
  end
end
