class Business::ReviewsController < Business::BaseController
  before_action :find_restaurant

  def index
    @reviews = @restaurant.reviews.order(created_at: :desc)
  end

  private
  def review_params
    params.require(:review).permit(:restaurant_id, :user_id, content)
  end

  def find_restaurant
    @restaurant = Restaurant.find_by(params[:restaurant_id])
  end
end
