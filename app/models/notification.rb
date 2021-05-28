class Notification < ApplicationRecord
  belongs_to :restaurant 
  belongs_to :customer, class_name: "User", foreign_key: "customer_id"
  belongs_to :driver, class_name: "User", foreign_key: "driver_id"
end
