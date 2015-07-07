class UsersController < ApplicationController

  def index

  end

  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account successfully created!"
      # send email
      UserMailer.signup_confirmation(@user).deliver
      binding.pry
      redirect_to "/"
    else
      binding.pry
      flash[:alert] = "There was a problem creating your account; please try again."
      redirect_to :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end

end
