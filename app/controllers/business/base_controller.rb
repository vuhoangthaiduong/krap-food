class Business::BaseController < ApplicationController
  before_action :authenticate_user!
  # include BusinessHelper
  layout "business"
end
