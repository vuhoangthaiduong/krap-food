class Customer::RestaurantsController < Customer::BaseController
  before_action :check_if_restaurant_exists, only: %i[show edit update destroy]
  before_action :find_restaurant
  def show
    @dealing_categories = FoodCategory.joins(:foods).where(foods: {restaurant_id: params[:id]}).distinct
    @review = Review.new
    @reviews = @restaurant.reviews.order(created_at: :desc)
    @restaurant_ratings = Review.where(restaurant_id: @restaurant.id).pluck(:rating).compact
    @restaurant_reviews = Review.where(restaurant_id: @restaurant.id).pluck(:content).compact
  end

 private
  def check_if_restaurant_exists
    if !Restaurant.exists?(params[:id])
      render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
      return
    end
    @restaurant = Restaurant.find(params[:id])
  end

  def find_restaurant
    @restaurant = Restaurant.find_by(params[:restaurant_id])
  end
end
