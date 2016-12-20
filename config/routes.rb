Rails.application.routes.draw do
  
 
  devise_for :users, controllers: {registrations: "registrations" }
  
 
  authenticated :user do
     root 'details#show', as: :authenticated_root
     devise_scope :user do
         get "users/picture" => "users"
         get "users/password" => "users"
       end
   
    resources :users do
    collection do
      get :picture
      get :password
    end
  end
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
  
 match 'blank_form' => 'blank_form#signup', :via => :post
  
 match 'contact' => 'contact#new',  :via => :get
 match 'contact' => 'contact#create', :via => :post
 
 match 'support' => 'support#new',  :via => :get
 match 'support' => 'support#create', :via => :post
  
  
  match ':id', :as => :outside_show, 
                                 :via => :get,
                                 :controller => :details, 
                                 :action => :outside_show
  
  
  
end
