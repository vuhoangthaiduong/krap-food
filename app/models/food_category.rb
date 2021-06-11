class FoodCategory < ApplicationRecord
  has_many :foods, foreign_key: "category_id"
  has_many :restaurants, through: :foods
  has_one_attached :image
end
