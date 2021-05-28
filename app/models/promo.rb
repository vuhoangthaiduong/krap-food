class Promo < ApplicationRecord
  belongs_to :restaurant
  has_many :foods
end
