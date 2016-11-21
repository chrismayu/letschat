class VisitorsController < ApplicationController
  
  def index
    
    @users = User.front_page
    
  end
  
  
end
