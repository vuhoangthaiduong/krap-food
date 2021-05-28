class Order < ApplicationRecord
  belongs_to :customer, class_name: "User", foreign_key: "customer_id"
  belongs_to :driver, class_name: "User", foreign_key: "driver_id"
  belongs_to :promo
  belongs_to :voucher
  has_many :food_option_orders
  has_many :food_options, through: :food_option_orders
end
