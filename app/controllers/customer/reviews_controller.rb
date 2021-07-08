class Customer::ReviewsController < Customer::BaseController
  before_action :review_params, only: %i[create]
  before_action :find_restaurant, only: %i[create]

  def new
    @review = current_user.reviews.build()
  end

  def create
    @review = current_user.reviews.create(review_params)
    redirect_to @restaurant
  end


  private
  def review_params
    params.require(:review).permit(:restaurant_id, :user_id, :content, :rating)
  end

  def find_restaurant
    @restaurant = Restaurant.find_by(params[:restaurant_id])
  end
end
