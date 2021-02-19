class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  attachment :image

<<<<<<< HEAD
=======
  # ここまで
  belongs_to :genre
>>>>>>> d70b648592fdba92fc3d6c66b6c13a44a0088481
end
