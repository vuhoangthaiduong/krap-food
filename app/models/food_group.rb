class FoodGroup < ApplicationRecord
  belongs_to :restaurant
  has_many :foods, foreign_key: "group_id", dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }

end
