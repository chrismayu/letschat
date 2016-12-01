Rails.application.routes.draw do
  
 
  devise_for :users, controllers: {registrations: "registrations" }
  
   
  authenticated :user do
     root 'details#show', as: :authenticated_root
      resources :users 
  end
 # resources :users 
  root to: 'visitors#index'
 

   resources :icons
  resources :details   
 # get ':id' => 'details#outside_show' 
  
  match ':id', :as => :outside_show, 
                                 :via => :get,
                                 :controller => :details, 
                                 :action => :outside_show
  
  
  
end
