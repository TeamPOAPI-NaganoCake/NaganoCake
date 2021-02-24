class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :deliveries, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
 with_options presence: true do
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :zip_code
    validates :address
    validates :phone_number
  end
  validates :email, uniqueness: true
  validates :first_name_kana, :last_name_kana,
      format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: "カタカナで入力して下さい。"}
  validates :zip_code, format: { with: /\A\d{7}\z/}
  validates :phone_number, format: { with: /\A\d{10,11}\z/}
  validates :cancel_flag, inclusion:{in: [true, false]}

  def active_for_authentication?
    super && (self.cancel_flag == true)
  end
  

end
