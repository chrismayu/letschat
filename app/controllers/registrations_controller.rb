class RegistrationsController < Devise::RegistrationsController
  
  def sign_up_params
     params.require(:user).permit( :display_name, :name, :email, :first_name, :last_name, :password, :password_confirmation)
  end
 
  def account_update_params
     params.require(:user).permit(:current_password, :email, :name, :first_name, :last_name, :password, :password_confirmation)
  end
 
   
 
 
end

