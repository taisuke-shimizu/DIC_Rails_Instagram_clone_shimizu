class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
  end

  def edit
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
