class Product < ApplicationRecord
  has_many :samples
  
  validates_presence_of :name, :marketing_statement, :product_discount, :product_price
end

