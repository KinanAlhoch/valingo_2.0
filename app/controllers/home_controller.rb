class HomeController < ApplicationController
  before_action :authenticate_user!
  require 'vline'
end
