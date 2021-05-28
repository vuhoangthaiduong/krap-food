class Food < ApplicationRecord
  belongs_to :restaurant
  belongs_to :promo
  has_many :food_options
end
