class Business::FoodsController < Business::BaseController

  def index
    respond_to do |format|
      format.html
      format.json { render json: FoodDatatable.new(view_context) }
    end
  end

end
