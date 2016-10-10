Rails.application.routes.draw do
  
  devise_for :users, controllers: {registrations: "registrations" }
  
  
  authenticated :user do
     root 'details#show', as: :authenticated_root
       
  end
  
  root to: 'visitors#index'
 

   resources :users 
  resources :details   
  get ':id' => 'details#outside_show' 
end
