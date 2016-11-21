class CreateDemoUser
  def call
    
    first_name = Faker::Name.first_name 
    last_name = Faker::Name.last_name 
    name = first_name + "-" + last_name
    puts "#{name}"
    
    user = User.find_or_create_by!(email: Faker::Internet.email(first_name)) do |user|
        user.password = 'passworddd'
        user.password_confirmation = 'passworddd'
        user.name = name
        user.display_name = name
        user.first_name = first_name
        user.last_name = last_name
        user.demo_user = true
        
      end
       puts "#{user.inspect}"
       
      detail = Detail.find_or_create_by!(user_id: user.id) do |detail|
          detail.details_email = user.email
          detail.cellphone = Faker::PhoneNumber.phone_number
          detail.save!
        
        end
      
      puts "#{detail.inspect}"
      
  end
  
  
  
end


 