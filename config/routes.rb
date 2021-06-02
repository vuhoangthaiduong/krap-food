Rails.application.routes.draw do

  scope "(:locale)", locale: /en|vi/ do
    devise_for :user, path: '', path_names: { sign_in: "login", sign_out: "logout", sign_up: "register" }

    namespace :business do
      root 'dashboards#index'
      get 'dashboard', to: 'dashboards#dashboard'
    end
    
    scope module: :customer do
      root 'static_pages#home'
    end
  end

end
