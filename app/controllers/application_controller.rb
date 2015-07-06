class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    # Return @current_user if it exists, otherwise set it, if it has an id
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    # less cleverly:
      # if @current_user
      #   @current_user
      # elsif session[:user_id]
      #   @current_user = User.find(session[:user_id])
      #   @current_user
  end

  # Make the curent_user method available to the erb file:
  helper_method :current_user

end
