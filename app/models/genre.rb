class Genre < ApplicationRecord
  has_many :items

	validates :genre_name,
	  presence: true,
    uniqueness: true,
    length: { maximum: 7 }
end
