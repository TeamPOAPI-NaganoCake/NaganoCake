class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  attachment :image
  # ここまで
  belongs_to :genre
  belongs_to :order_item
end
