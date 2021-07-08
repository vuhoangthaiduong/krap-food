Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'
  scope "(:locale)", locale: /en|vi/ do
    devise_for :user, path: '', path_names: { sign_in: "login", sign_out: "logout", sign_up: "register" }

    namespace :business do
      root 'dashboards#index'
      get 'dashboard', to: 'dashboards#dashboard'
      resources :foods, path_names: { index: "menu" }
      resources :promos
      resources :food_groups

      get 'dashboards/choose_restaurant/:restaurant_id', to: 'dashboards#choose_restaurant'  
      get 'customers_review', to: 'reviews#index'
    end
    
    namespace :restaurant do
      get "register", to: "restaurants#new"
      post "register", to: "restaurants#create"
      get "listing", to: "restaurants#index"
    end

    scope module: :customer do
      root 'static_pages#home'
      resources :restaurants
      resources :orders, except: :new
      post 'orders/new', to: 'orders#new'
      resources :reviews, only: [:index, :new, :create]
    end
  end

end
