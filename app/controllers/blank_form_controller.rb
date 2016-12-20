class BlankFormController < ApplicationController
 
  

  def signup
    @email = BlankForm.new(params[:blank_form])
  
 
      redirect_to new_user_registration_path(email: @email.email) 
    
  end
end