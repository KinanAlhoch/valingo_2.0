class UsersController < ApplicationController
  before_action :authenticate_user!

  def pals
    @users = current_user.followers(User)
  end

  def add_pal
    @user = User.find(params[:id])
    current_user.follow!(@user)
    @user.follow!(current_user)
    flash[:notice] = "#{@user.email} has been added to you pals list"
    redirect_to pals_users_path
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :city, :state, :country)
  end
end
