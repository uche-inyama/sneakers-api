class Sample < ApplicationRecord
  belongs_to :product
  validates_presence_of :image_data, :product_id
end
