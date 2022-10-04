class Item < ApplicationRecord
  has_one_attached:image
  has_many:cart_items,dependent: :destroy
  has_many:order_products,dependent: :destroy 
  belongs_to:item
end
