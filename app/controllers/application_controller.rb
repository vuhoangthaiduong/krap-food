class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
 
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
 
  protected
 
  def configure_permitted_parameters
    added_attrs = [:phone_number, :email, :password, :password_confirmation, :remember_me,
                   :first_name, :last_name, :gender, :date_of_birth]
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
