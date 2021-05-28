class User < ApplicationRecord
  has_many :restaurant_users
  has_many :restaurants, through: :restaurant_users
  has_many :restaurant_rating_users
  has_many :driver_rating_users
  has_many :role_users
  has_many :roles, through: :role_users
  has_many :orders

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format:{ with: VALID_EMAIL_REGEX },
                    uniqueness: true
end
