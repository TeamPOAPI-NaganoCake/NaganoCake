class Delivery < ApplicationRecord
  
  belongs_to :customer
  
  with_options presence: true do
    validates :name
    validates :zip_code
    validates :address
  end

  # orderに郵便番号・住所・名前表示するのに使います
  def view_destination
    "#{self.zip_code} #{self.address} #{self.name}"
  end
    
  validates :zip_code, format: { with: /\d{7}/}
end
