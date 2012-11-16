class UserMailer < ActionMailer::Base
  default from: "pholderbeta@gmail.com"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Pholder Registration Complete")
  end

  def forgot_password(user)
  	@user = user
  	mail(:to => "#{user.name} <#{user.email}>", :subject => "Password for Your Pholder Account")
  end

  def contact_us(name, email, comments)
    @person = [name, email, comments]
    mail(:to => "pholderbeta@gmail.com", :subject => "#{name} <#{email}> has made comments")
  end
end
