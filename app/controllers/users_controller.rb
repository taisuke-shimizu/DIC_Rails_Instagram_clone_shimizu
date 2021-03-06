class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end
  def show
  end
  def edit
    if @user.id == current_user.id
      render :edit
    else
      redirect_to user_path
    end
  end
  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end
  def set_user
    @user = User.find(params[:id])
  end
end