class Customer::StaticPagesController < Customer::BaseController
  def home
    @food_categories = FoodCategory.all
    @restaurants = Restaurant.all
  end
end
