class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  validates :product_amount, numericality: {
    greater_than: 0,
    less_than_or_equal_to: 100
  }



  # 小計　うまくいかないのでいったんコメントアウト
  # def sub_total_price
  #   tax = 1.1
  #   (non_tax_price * tax).floor * cart_item.product_amount
  # end

  # 合計
  def total_price
    to_a.sum{ |item| non_tax_price * product_amount }
  end
end
