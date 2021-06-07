class Business::FoodsController < Business::BaseController
  def new
    @food = Food.new
  end
  
  def create
    @food = Food.new(food_params)
    if @food.save
      redirect_to @food
    else
      render :new
    end
  end

  def show
    @food=Food.find_by(id: params[:id])
  end

  private

    def food_params
      params.require(:food).permit(:name, :price, :type_id, :restaurant_id, :promo_id, :availability, :image)
    end

end
