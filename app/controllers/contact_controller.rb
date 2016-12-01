class ContactController < ApplicationController
 
  
  
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
  
    if @message.valid?
        ContactusMailer.new_message(@message).deliver_now
      redirect_to root_path, :notice => "Thank you for your message. We will contact you soon!"
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end