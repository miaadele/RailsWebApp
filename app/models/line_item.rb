class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product #defines an accessor method and tells rails that rows in line_items are children of rows in carts and products
  belongs_to :cart, optional:true
  def total_price
    product.price * quantity
  end
end
