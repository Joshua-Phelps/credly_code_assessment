class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
      redirect_to login_path
    else
      flash.now[:alert] = "Email or password is invalid"
      render :signup
    end 
  end

  private

  def user_params 
    params.require(:user).permit(:email, :password)
  end 
end
