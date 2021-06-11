Rails.application.routes.draw do

  scope "(:locale)", locale: /en|vi/ do
    devise_for :user, path: '', path_names: { sign_in: "login", sign_out: "logout", sign_up: "register" }

    namespace :business do
      root 'dashboards#index'
      get 'dashboard', to: 'dashboards#dashboard'
      resources :foods, path_names: { index: "menu" }
      resources :promos
      resources :food_groups

      get 'dashboards/choose_restaurant/:restaurant_id', to: 'dashboards#choose_restaurant'  
    end
    
    namespace :restaurant do
      get "register", to: "restaurants#new"
      post "register", to: "restaurants#create"
      get "listing", to: "restaurants#index"
    end

    scope module: :customer do
      root 'static_pages#home'
    end
  end

end
