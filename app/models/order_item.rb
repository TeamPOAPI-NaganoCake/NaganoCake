class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :item_id, :order_id, :amount, :purchase_price, presence: true
  validates :purchase_price, :amount, numericality:{ only_integer: true}
  enum production_status: {"着手不可": 0, "制作待ち": 1, "制作中": 2, "制作完了": 3}

end
