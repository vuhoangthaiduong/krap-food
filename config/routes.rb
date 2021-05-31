Rails.application.routes.draw do

  devise_for :user, path: '', path_names: { sign_in: "login", sign_out: "logout", sign_up: "register" }
  
  scope module: :customer do
    root   'static_pages#home'
  end

  namespace :business do
    root   'dashboards#index'
    get    'dashboard',  to: 'dashboards#dashboard'

  end

end
