class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  attachment :image
  # ここまで
  belongs_to :genre
end
