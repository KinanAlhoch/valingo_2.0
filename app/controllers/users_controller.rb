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
end
