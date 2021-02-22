class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
<<<<<<< HEAD
  belongs_to :order_item
=======
  attachment :image

  validates :name, presence: true, uniqueness: true
  validates :caption, presence: true, length: {maximum: 100}
  validates :genre_id, presence: true
  validates :non_tax_price, presence: true
>>>>>>> 5e709f1009f66b9f492411efd9fdbe1499bdcf94
end
