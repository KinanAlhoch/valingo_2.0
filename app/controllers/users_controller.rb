class UsersController < ApplicationController
  before_action :authenticate_user!
  require 'vline'

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
      @user.languages_spoken = save_languages(params[:user][:languages_spoken])
      @user.languages_learn = save_languages(params[:user][:languages_learn])
      @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def unfriend
    @user = User.find(params[:id])
    current_user.unfollow!(@user)
    @user.unfollow!(current_user)
    flash[:notice] = "#{@user.email} has been removed from your pals list"
redirect_to root_path
  end

  private

  def save_languages(param)
    languages = ""
    param.each do |lang|
      unless lang.blank?
	languages += "#{lang},"
      end
    end
    languages
  end
  def user_params
    params.require(:user).permit(:name, :city, :state, :country, :languages_spoken, :languages_learn, :picture)
  end
end
