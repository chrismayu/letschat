class ApplicationMailer < ActionMailer::Base
  default from: ENV["SITE_EMAIL"]
  layout 'mailer'
  
  default :to => ENV["ADAM_EMAIL"]

  
  
end
