class SessionsController < ApplicationController

  def new
    @page_name = 'Log In to Alpha BLog'
  end

  def create
    # byebug
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Hi, #{user.username}! Welcome back!"
      redirect_to user
    else
      flash.now[:alert] = "Username and password combination does not match our records"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to root_path
  end
end
