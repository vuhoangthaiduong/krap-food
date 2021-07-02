module RestaurantHelper
  def get_status_badge(restaurant)
    if restaurant.is_open?
      return %q[<span class="badge badge-success">OPEN</span>].html_safe
    else
      return %q[<span class="badge badge-danger">CLOSED</span>].html_safe
    end
  end
end
