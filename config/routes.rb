Rails.application.routes.draw do
  
 
  devise_for :users, controllers: {registrations: "registrations" }
  
   
  authenticated :user do
     root 'details#show', as: :authenticated_root
     
 
  end

 
 resources :visitors do
   collection do
     get :autocomplete
   end
 end
 
  root to: 'visitors#index'
 

   resources :icons
  resources :details   
 # get ':id' => 'details#outside_show' 
  
 
  
 match 'contact' => 'contact#new',  :via => :get
 match 'contact' => 'contact#create', :via => :post
 
 match 'support' => 'support#new',  :via => :get
 match 'support' => 'support#create', :via => :post
  
  
  match ':id', :as => :outside_show, 
                                 :via => :get,
                                 :controller => :details, 
                                 :action => :outside_show
  
  
  
end
