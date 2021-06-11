class Restaurant < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :food_groups
  has_many :foods, through: :food_groups
  has_many :foods
  has_many :food_categories, through: :foods
  has_many :restaurant_users
  has_many :users, through: :restaurant_users
  has_many :promos
  has_many :vouchers
  has_many :restaurant_rating_users
  has_many :notifications

  validates :name, presence: true
  validates :address, presence: true
  
  has_one_attached :image
end
