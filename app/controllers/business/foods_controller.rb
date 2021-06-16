class Business::FoodsController < Business::BaseController

  before_action :check_if_food_exists, only: %i[show edit update destroy]

  def index
    @foods = current_restaurant.foods.order(name: :asc).page(params[:page]).per(9)
    @groups = current_restaurant.food_groups
  end

  def show
  end

  def new
    @food = current_restaurant.foods.build()
  end

  def create
    @food = current_restaurant.foods.build()
    @food.assign_attributes(food_params)
  
    if params[:food][:image_1].instance_of?(ActionDispatch::Http::UploadedFile)
      @food.image_1.attach params[:food][:image_1]
    end
    if params[:food][:image_2].instance_of?(ActionDispatch::Http::UploadedFile)
      @food.image_2.attach params[:food][:image_2]
    end
    if params[:food][:image_3].instance_of?(ActionDispatch::Http::UploadedFile)
      @food.image_3.attach params[:food][:image_3]
    end
  
    if @food.save
      redirect_to business_food_path(@food)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @food.assign_attributes(food_params)
  
    if params[:food][:image_1].instance_of?(ActionDispatch::Http::UploadedFile)
      @food.image_1.attach params[:food][:image_1]
    end
    if params[:food][:image_2].instance_of?(ActionDispatch::Http::UploadedFile)
      @food.image_2.attach params[:food][:image_2]
    end
    if params[:food][:image_3].instance_of?(ActionDispatch::Http::UploadedFile)
      @food.image_3.attach params[:food][:image_3]
    end
  
    if @food.save
      redirect_to business_food_path(@food)
    else
      render :edit
    end
  end

  def destroy
    @food.destroy
    flash[:success] = t("business.controllers.foods_controller.destroy.success")
    redirect_to business_foods_path
  end

  private
    def food_params
      params.require(:food).permit( :name,
                                    :restaurant_id,
                                    :price,
                                    :category_id,
                                    :promo_id,
                                    :availability,
                                    :details,
                                    :group_id,
                                    :image_1,
                                    :image_2,
                                    :image_3)
    end

    def check_if_food_exists
      if !Food.exists?(params[:id])
        render file: "#{Rails.root}/public/404.html",  layout: false, status: :not_found
        return
      end
      @food = Food.find(params[:id])
    end

end
