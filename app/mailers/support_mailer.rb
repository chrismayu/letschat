class SupportMailer < ApplicationMailer
  
  def new_message(message)
    @message = message
    mail(:subject => "LetsChat/Tech Support - #{message.email} & #{DateTime.now}", :reply_to => message.email,)
  end
  
end
