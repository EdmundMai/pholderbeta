class PasswordResetsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_email(params[:new_password][:email])
  	user.send_password_reset if user
  	flash[:success] = "You will receive your password shortly by email."
  	redirect_to root_url
  end

  def edit
  	@user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.update_attributes(params[:user])
      create_remember_token(@user)
      redirect_to root_url, :notice => "Your password has been reset."
    else
      render :edit
    end	
  end
end
