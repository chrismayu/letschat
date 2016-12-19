class CreateDemoUser
  def call
    
    first_name = Faker::Name.first_name 
    last_name = Faker::Name.last_name 
    name = first_name + "-" + last_name
    email = Faker::Internet.email(first_name)
    
    users = User.find_or_create_by!(email: email) do |user|
        user.password = 'passworddd'
        user.password_confirmation = 'passworddd'
        user.name = name
        user.display_name = name
        user.first_name = first_name
        user.last_name = last_name
        user.demo_user = true
         
      end
      
     # users.details.update!(:cellphone => Faker::PhoneNumber.phone_number , :details_email => email )
    
       puts "#{users.inspect}"
       puts "#{users.email}"
       
       
             
    detail = Detail.find(users.id )  
    puts "#{detail.inspect}"
    detail.cellphone = Faker::PhoneNumber.phone_number 
    detail.details_email = email
    detail.save!
        
     
      
      puts "#{detail.inspect}"
      
  end
  
  
  
end


 