class HomeController < ApplicationController
  before_action :authenticate_user!
  require 'vline'

  def index
    @users = User.all
  end
end
