class HomesController < ApplicationController
  def index
  end

  def create
    ModelMailer.new_record_notification.deliver
    redirect_to root_url
  end
end
