class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user.id), notice: "Welcome #{@user.first_name}!"
    else
      render "new"
    end
  end

  def show
    @posts = current_user.posts.all
  end

  private
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :password_confirmation, :avatar)

  end
end
