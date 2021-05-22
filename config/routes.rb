Rails.application.routes.draw do
  resources :products
  devise_for :users, skip: [:registrations]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  
  # get 'hello_world', to: 'hello_world#index'
  root to: "pages#home"
end
