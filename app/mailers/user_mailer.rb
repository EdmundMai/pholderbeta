class UserMailer < ActionMailer::Base
  default from: "edmundmai@gmail.com"

  def registration_confirmation(user)
    @user = user
    attachments['smalllogo.png'] = File.read("#{Rails.root}/app/assets/images/smalllogo.png")
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Pholder Registration Complete")
  end

  def forgot_password(user)
  	@user = user
  	mail(:to => "#{user.name} <#{user.email}>", :subject => "Password for Your Pholder Account")
  end

  def contact_us(name, email, comments)
    @person = [name, email, comments]
    mail(:to => "edmundmai@gmail.com", :subject => "#{name} <#{email}> has made comments")
  end
end
