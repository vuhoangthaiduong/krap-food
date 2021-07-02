class User < ApplicationRecord
  has_many :restaurants, foreign_key: "owner_id"
  has_many :restaurants_users
  has_many :favourite_restaurants, through: :restaurants_users
  has_many :restaurant_rating_users
  has_many :driver_rating_users
  has_many :role_users
  has_many :roles, through: :role_users
  has_many :orders, dependent: :destroy, foreign_key: "customer_id"

  attr_writer :login

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  VALID_PHONE_NUMBER_REGEX = /\A(\+84|0)+(3[2-9]|5[6|8|9]|9\d(?!5)|8[1-9]|7[0|6-9])+([0-9]{7})\z/
  validates :phone_number, presence: true,
                           format: { with: VALID_PHONE_NUMBER_REGEX },
                           uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:login]

  def login
    @login || self.phone_number || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["phone_number = :value OR email = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:phone_number) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

end
