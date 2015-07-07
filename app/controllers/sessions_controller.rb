class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] = "Successfully logged in!"
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:notice] = "There was a problem logging you in."
      redirect_to log_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've been successfully logged out."
    redirect_to '/'
  end


end
