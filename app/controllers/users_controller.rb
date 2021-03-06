class UsersController  < Devise::RegistrationsController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.all
    authorize User
  end

  def picture
    @user = User.friendly.find(params[:id])
     authorize @user
  end
  
  def password
    @user = User.friendly.find(params[:id])
     authorize @user 
  end


  def show
    @user = User.friendly.find(params[:id])
    authorize @user
  end

  def update
    @user = User.friendly.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.friendly.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private
  
  def user_params
    params.require(:user).permit(:profile_image)
  end

  def secure_params
    params.require(:user).permit(:role)
  end

end
