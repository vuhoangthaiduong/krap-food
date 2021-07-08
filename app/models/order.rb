class Order < ApplicationRecord
  belongs_to :customer, class_name: "User", foreign_key: "customer_id"
  belongs_to :driver, class_name: "User", foreign_key: "driver_id", optional: true
  belongs_to :promo, optional: true
  belongs_to :voucher, optional: true
  has_many :foods_orders, dependent: :destroy
  has_many :foods, through: :foods_orders
end
