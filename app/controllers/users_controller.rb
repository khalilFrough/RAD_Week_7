class UsersController < ApplicationController

  def new
    @user= User.new
  end
 
  def show 
    @user = User.find(params[:id])
  end 
 # creating a user 
 def create
  @user = User.new(user_params)
  if @user.save
    log_in @user
    flash[:success] = "You have signed in successfully!" 
    redirect_to @user
  else
    render 'new'
  end
end

private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
end
