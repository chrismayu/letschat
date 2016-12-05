class VisitorsController < ApplicationController
  
  def index
    
    @users = User.front_page
    
     query = params[:q].presence || "*"
     @users = User.search(query, suggest: true, limit: 20)
    
  end
  
  

  def autocomplete
    render json: User.search(params[:term], fields: [{name: :text_start}], limit: 10).map(&:name)
  end  
  
  
end
