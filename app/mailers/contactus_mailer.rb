class ContactusMailer < ApplicationMailer
  
  
  def new_message(message)
    @message = message
    mail(:subject => "LetsChat - #{message.email} & #{DateTime.now}", :reply_to => message.email,)
  end
  
end
