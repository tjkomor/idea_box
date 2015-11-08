class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create  
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to @user
    else
      flash.now[:errors] = 'Please enter correct username and password'
      redirect_to login_path
    end
  end

end
