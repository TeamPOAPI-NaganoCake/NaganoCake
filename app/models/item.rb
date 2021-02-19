class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  attachment :image

  validates :name, presence: true, uniqueness: true
  validates :caption, presence: true, length: {maximum: 100}
  validates :non_tax_price, presence: true
end
