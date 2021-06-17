class Business::PromosController < Business::BaseController
  
  before_action :check_if_promo_exists, only: %i[show edit update destroy]

  def index
    @promos = current_restaurant.promos.page(params[:page]).per(10)
  end

  def show
  end

  def new
    @promo = current_restaurant.promos.build()
  end

  def create
    @promo = current_restaurant.promos.build(promo_params)
    if @promo.save
      redirect_to business_promo_path(@promo)
    else
      render :new
    end
  end

  def edit
  end

  def update  
    if @promo.update(promo_params)
      redirect_to business_promo_path
    else
      render "edit"
    end
  end

  private
  def promo_params
    params.require(:promo).permit(:name,
                                  :restaurant_id,
                                  :amount,
                                  :condition_amount,
                                  :discount_amount,
                                  :discount_type,
                                  :valid_from,
                                  :valid_to)
  end

  def check_if_promo_exists
    if !Promo.exists?(params[:id])
      render file: "#{Rails.root}/public/404.html",  layout: false, status: :not_found
      return
    end
    @promo = Promo.find(params[:id])
  end

end
