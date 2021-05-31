class Business::DashboardsController < Business::BaseController

  def index
    redirect_to business_dashboard_path
  end

  def dashboard
  end

end
