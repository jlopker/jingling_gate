class HomesController < ApplicationController
  def index
  end

  def create
    @message = Message.new(params[:message].permit(:first_name, :last_name, :email, :body))
    
    if @message.save
      ModelMailer.new_record_notification(@message.body, @message.email, @message.first_name, @message.last_name).deliver
      redirect_to root_url
    end
  end

end
