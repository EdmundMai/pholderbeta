class HomeController < ApplicationController
  def index
  end

  def help
  end

  def feedback
  end

  def contact
  end

  def create
    UserMailer.contact_us(params[:suggestions][:name], params[:suggestions][:email], params[:suggestions][:comments]).deliver
    redirect_to root_url, :notice => "We appreciate your effort in helping us improve!"
  end

  
end
