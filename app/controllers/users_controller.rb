class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_url(@user.id), notice: "Welcome #{@user.first_name}!"
    else
      render "new"
    end
  end

  def show
    if current_user.posts == nil
      puts "You have no blogs posted."
    else
      @posts = current_user.posts.all
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :avatar)

  end
end
