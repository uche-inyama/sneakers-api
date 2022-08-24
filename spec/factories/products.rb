FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    marketing_statement { Faker::Marketing.buzzwords }
    product_price { Faker::Commerce.price }
    product_discount { 0.3 }
  end
end
