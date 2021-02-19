class Item < ApplicationRecord
  # admin未作成のため、商品登録用。後々消します。
  attachment :image
  has_many :cart_items, dependent: :destroy

  # ここまで
  belongs_to :genre
end
