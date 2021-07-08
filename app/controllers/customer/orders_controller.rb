class Customer::OrdersController < Customer::BaseController

  def index
  end

  def show
  end

  def new
    @order = current_user.orders.build()
    @items = get_items_and_quantity_from_data
    respond_to do |format|
      # format.html
      format.js # new.js.erb
    end
  end

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def order_params
      params.permit(:data)  
    end

    def get_items_and_quantity_from_data
      data = params.to_unsafe_h
      return data["data"].to_h.values
    end

end
