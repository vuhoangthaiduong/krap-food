class Business::DashboardsController < Business::BaseController

  def index
    redirect_to business_dashboard_path
  end

  def dashboard
  end

  def choose_restaurant
    restaurant = Restaurant.find_by(id: params[:restaurant_id])
    if !restaurant.nil?
      set_current_restaurant(restaurant)
      respond_to do |format|
        format.js {render inline: "window.location = '#{business_dashboard_path}'" }
      end
    end
  end

end
