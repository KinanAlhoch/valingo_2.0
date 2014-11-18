class HomeController < ApplicationController
  before_action :authenticate_user!
  require 'vline'

  def index
    @feeds = HomeFeed.order('created_at desc')
  end

  def add_feed
    unless params[:status].blank?
      @feed = HomeFeed.new(:status => params[:status])
      @feed.user = current_user
      @feed.save
    else
      flash[:notice]= "Please enter a text!"
    end
    redirect_to root_path
  end
end
