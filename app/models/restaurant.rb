class Restaurant < ApplicationRecord
  RESTAURANT_CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, numericality: { only_integer: true }
  validates :category, inclusion: { in: RESTAURANT_CATEGORIES }

end
