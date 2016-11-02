Rails.application.routes.draw do
  
  resources :icons
  devise_for :users, controllers: {registrations: "registrations" }
  
   
  authenticated :user do
     root 'details#show', as: :authenticated_root
      resources :users 
  end
 # resources :users 
  root to: 'visitors#index'
 

  
  resources :details   
  get ':id' => 'details#outside_show' 
end
