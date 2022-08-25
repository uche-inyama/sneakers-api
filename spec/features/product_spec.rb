require 'rails_helper'

RSpec.feature "Products", type: :feature do
  let!(:admin) { create(:admin) }

  it "successfully creates a product" do
    sign_in admin
    visit products_path
    expect(current_path).to eq(products_path)
    expect(page).to have_content('create a product')
    click_on 'create a product'
    fill_in "product[name]", with: "Nike air"
    fill_in "product[marketing_statement]", with: "Good thinking"
    fill_in "product[product_price]", with: 1000
    fill_in "product[product_discount]", with: 50
    click_on "Create Product"
    expect(page).to have_content('Nike air')
  end

  it "successfully updates a product" do
    sign_in admin
    visit products_path
    create_product
    expect(current_path).to eq(products_path)
    click_on "Edit"
    fill_in "product[name]", with: "Prada"
    click_on "Update Product"
    expect(page).to have_content('Prada')
  end

  it "successfully deletes a product" do
    sign_in admin
    visit products_path
    create_product
    click_on "Delete"
    expect(page).to have_content('Product deleted successfully')
  end
end
