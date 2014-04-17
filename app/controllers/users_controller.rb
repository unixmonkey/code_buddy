class UsersController < ApplicationController

  def show
      @user = User.find(user_params[:id])
  end
  def index
      @users = User.all
  end
  
  private
  def user_params
      params.require(:user).permit(:first_name, :last_name, :interests)
  end

end
