class SessionsController < ApplicationController
  
  def new
  end

  def create
  	user = User.find_by_email(params[:session][:email])
  	if user && (!params[:session][:email].blank?) && user.authenticate(params[:session][:password])
      if params[:remember_me]
        cookies.permanent[:remember_token] = user.remember_token
      else
        cookies[:remember_token] = user.remember_token
      end
  	  sign_in user
  	  redirect_to user_path(user)
  	else
  	  flash.now[:error] = "Invalid email and/or password."
  	  render 'new'
  	end
  end

  def destroy
  	sign_out
  	redirect_to root_url
  end
end
