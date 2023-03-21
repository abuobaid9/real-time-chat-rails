class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome to the Rails Chat  #{@user.username}, you have successfully signed up"
      redirect_to root_path
    else
      flash.now[:error] = "There was something wrong with your information"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
