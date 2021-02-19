class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :genre
  attachment :image
<<<<<<< HEAD

=======
  # ここまで
  belongs_to :genre
>>>>>>> 2b4fb5f77cb7d0bd3d7ae549f1293f8eb9184f0d
end
