class Restaurant::RestaurantsController < ApplicationController
  
  def index
    @food_categories = FoodCategory.all
    if params[:search].present?
      @restaurants = Restaurant.near(params[:search], 10, units: :km)
      @location = Geocoder.search(params[:search]).first.coordinates
    else
      @restaurants = Restaurant.all
    end
    
    case params[:sort]
    when 1
      @restaurants = Restaurant.near(params[:search], 10, units: :km, order: 'distance')
    end
  end
  
  def new
    @restaurant = current_user.restaurants.build
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    if @restaurant.save
      flash[:success] = I18n.t("controllers.restaurant.restaurants_controller.success")
      redirect_to business_dashboard_path
    else
      flash[:danger] = I18n.t("controllers.restaurant.restaurants_controller.danger")
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:owner_id, :name, :address)
  end
end
