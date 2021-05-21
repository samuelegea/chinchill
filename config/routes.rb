Rails.application.routes.draw do
  resources :products
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  root to: "pages#home"
end
