class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  # has_one_attached :image_1
  # has_one_attached :image_2
  # has_one_attached :image_3
end
