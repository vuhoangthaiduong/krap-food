class Food < ApplicationRecord
  belongs_to :restaurant
  belongs_to :promo, optional: true
  belongs_to :category, optional: true, class_name: "FoodCategory", foreign_key: "category_id"
  belongs_to :group, class_name: "FoodGroup", foreign_key: "group_id"
  has_many :foods_orders, dependent: :destroy
  has_many :orders, through: :foods_orders
  has_one_attached :image_1
  has_one_attached :image_2
  has_one_attached :image_3
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :details, length: { maximum: 255 }
  validates :price, presence: true
  validates :category, presence: true
  validates :availability, presence: true
  validates :image_1, presence: true
  validates :image_2, presence: true
  validates :image_3, presence: true

end
