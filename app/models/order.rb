class Order < ApplicationRecord
<<<<<<< HEAD
  belongs_to :customer
  has_many :order_products, dependent: :destroy

  # 空欄のままではダメ
  validates :customer_id, :delivery_address, :delivery_name, :shipping_price, :billing_amount, :payment_method, presence: true
  # 郵便番号の桁数は7以外ダメ
  validates :delivery_zipcode, length: {is: 7}, numericality: {only_integer: true }
  # 送料、請求額は数値のみ許可
  validates :shipping_price, :billing_amount, numericality: { only_integer: true }

  
  enum payment_method: { "クレジットカード": 0, "銀行振込": 1 }
  enum order_status: {"入金待ち": 0, "入金確認": 1, "制作中": 2, "発送準備中": 3, "発送済み": 4 }
=======
>>>>>>> 03fa423b8822b8caa702cd72d3c50cd9642c05d4
end
