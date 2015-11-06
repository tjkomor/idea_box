class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    redirect_to ideas_path
  end

end
