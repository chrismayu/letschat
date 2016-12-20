class VisitorsController < ApplicationController
  layout "application_index", only: [:index]
  
  def index
    
    @blank_form = BlankForm.new
    @users = User.front_page
    
     query = params[:q].presence || "*"
     @users = User.search(query, suggest: true, limit: 200)
    
  end
  
  
  
  def search
    
    @blank_form = BlankForm.new
    @users = User.front_page
    
     query = params[:q].presence || "*"
     @users = User.search(query, suggest: true, limit: 200)
    
  end
  

  def autocomplete
    render json: User.search(params[:term], fields: [{name: :text_start}], limit: 10).map(&:name)
  end  
  
  
end
