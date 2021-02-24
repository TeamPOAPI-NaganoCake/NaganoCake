class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  has_many :orders, through: :order_items
  has_many :order_items
  attachment :image

  validates :name, presence: true, uniqueness: true
  validates :caption, presence: true, length: {maximum: 100}
  validates :genre_id, presence: true
  validates :non_tax_price, presence: true
  
 
end
