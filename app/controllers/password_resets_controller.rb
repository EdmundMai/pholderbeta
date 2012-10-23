class PasswordResetsController < ApplicationController
  def new
  end

  def create
  	@user = User.find_by_email(params[:new_password][:email])
  	UserMailer.forgot_password(@user).deliver
  	flash[:success] = "You will receive your password shortly by email."
  	redirect_to root_url
  end
end
