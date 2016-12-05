class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit( :display_name, :name, :email, :first_name, :last_name, :password, :password_confirmation,:profile_image_id ,:profile_image, :tag_list)
  end

  def account_update_params
    params.require(:user).permit( :current_password, :email, :name, :first_name, :last_name, :password, :password_confirmation, :profile_image_id , :profile_image, :remove_profile_image, :tag_list)
  end
end

