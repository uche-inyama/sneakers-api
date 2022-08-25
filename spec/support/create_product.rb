module CreateProductHelper
  def create_product
    click_on 'create a product'
    fill_in "product[name]", with: "Nike air"
    fill_in "product[marketing_statement]", with: "Good thinking"
    fill_in "product[product_price]", with: 1000
    fill_in "product[product_discount]", with: 50
    click_on "Create Product"
  end
end