class Business::FoodGroupsController < Business::BaseController
  before_action :check_if_food_group_exists, only: %i[show edit update destroy]

  def show
  end

  def new
    @food_group = current_restaurant.food_groups.build()
    respond_to do |format|
      format.html
      format.js # new.js.erb
    end
  end

  def create
    @food_group = current_restaurant.food_groups.build(food_group_params)

    if @food_group.save
      redirect_to business_foods_path
    else
      render partial: "_new_food_group"
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js # new.js.erb
    end
  end

  def update  
    if @food_group.update(food_group_params)
      redirect_to business_foods_path
    else
      render partial: "_edit_food_group"
    end
  end

  def destroy
    @food_group.destroy
    flash[:success] = t("business.controllers.foods_controller.destroy.success")
    redirect_to business_foods_path
  end

  private
    def food_group_params
      params.require(:food_group).permit( :name,
                                          :restaurant_id,
                                          :description)
    end

    def check_if_food_group_exists
      if !FoodGroup.exists?(params[:id])
        render file: "#{Rails.root}/public/404.html",  layout: false, status: :not_found
        return
      end
      @food_group = FoodGroup.find(params[:id])
    end

end
