Rails.application.routes.draw do
  devise_for :users
  
  scope module: :customer do
    root   'static_pages#home'
  end

  namespace :business do
    root   'dashboards#index'
    get    'dashboard',  to: 'dashboards#dashboard'
    resources :foods

  end

end
