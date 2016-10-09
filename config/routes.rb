Rails.application.routes.draw do
  
  namespace :admin do
    resources :users
    root to: "users#index"
  end
  root to: 'visitors#index'
   devise_for :users, controllers: {registrations: "registrations" }
   
  resources :users 
  resources :details   
  get ':id' => 'details#outside_show' 
end
