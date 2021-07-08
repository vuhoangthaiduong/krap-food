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
  has_many :reviews

  validates :name, presence: true
  validates :address, presence: true
  
  has_one_attached :image

  geocoded_by :address
  after_validation :geocode
  
  def is_open?
    return Time.zone.now.between?(open_at.to_s(:time), close_at.to_s(:time))
  end

end
