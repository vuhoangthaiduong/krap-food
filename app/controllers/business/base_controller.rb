class Business::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :current_restaurant
  layout "business"

  def current_restaurant
    if cookies.signed[:current_restaurant_id].nil?
      cookies.permanent.signed[:current_restaurant_id] = current_user.restaurants.first.id
      return current_user.restaurants.first
    else
      return Restaurant.find(cookies.permanent.signed[:current_restaurant_id])
    end
  end

  helper_method :current_restaurant

  def set_current_restaurant(restaurant)
    if restaurant.id != cookies.signed[:current_restaurant_id]
      cookies.delete :current_restaurant_id
      cookies.permanent.signed[:current_restaurant_id] = restaurant.id
    end
  end

end
