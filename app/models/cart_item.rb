class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  validates :product_amount, numericality: {less_than_or_equ: 30}
  
  def tax_include_price
    tax = 0.1
    (non_tax_price * (1 + tax)).floor.to_s(:delimited)
  end
  
  # 小計
  def sub_total_price
    item.non_tax_price * product_amount
  end
  
  # 合計
  def total_price
    cart_items.to_a.sum{ |item| item.sub_total_price }
  end
end
