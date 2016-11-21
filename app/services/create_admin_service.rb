class CreateAdminService
  def call
    
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
       
        user.name = 'chris'
        user.display_name = 'chris'
        user.first_name = 'chris'
        user.last_name = 'mayu'
        user.demo_user = true
        user.admin!
         
      end
      
      detail = Detail.find_or_create_by!(user_id: user.id) do |detail|
          detail.details_email = Rails.application.secrets.admin_email
          detail.cellphone = Faker::PhoneNumber.phone_number
        end
          puts "#{detail.inspect}"  
      
  end
end
