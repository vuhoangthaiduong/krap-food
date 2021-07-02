class Customer::RestaurantsController < Customer::BaseController
  before_action :check_if_restaurant_exists, only: %i[show edit update destroy]

  def show
    @dealing_categories = FoodCategory.joins(:foods).where(foods: {restaurant_id: params[:id]}).distinct
  end

  private
  def check_if_restaurant_exists
    if !Restaurant.exists?(params[:id])
      render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
      return
    end
    @restaurant = Restaurant.find(params[:id])
  end
end
