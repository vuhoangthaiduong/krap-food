class Promo < ApplicationRecord
  belongs_to :restaurant
  has_many :applied_items, class_name: "Food", dependent: :nullify
  validates :name, presence: true, length: { maximum: 50 }

  def discount_type_in_text()
    type = String.new()
    type = case self.discount_type
    when 1
      "đ"
    when 2
      "%"
    else
      "undefined"
    end
    return type
  end
  
end
