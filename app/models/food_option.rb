class FoodOption < ApplicationRecord
  belongs_to :food
  has_many :food_option_orders
  has_many :orders, through: :food_option_orders
end 
