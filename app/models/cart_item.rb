class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  validates :product_amount, numericality: {less_than_or_equ: 30}
end
