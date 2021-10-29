class OrderDetail < ApplicationRecord
  belongs_to :cart_items
  belongs_to :items
end
