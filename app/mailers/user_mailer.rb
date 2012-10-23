class UserMailer < ActionMailer::Base
  default from: "pholder@pholder.com"

  def registration_confirmation(user)
    @user = user
    attachments['smalllogo.png'] = File.read("#{Rails.root}/app/assets/images/smalllogo.png")
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Pholder Registration Complete")
  end

  def forgot_password(user)
  	@user = user
  	mail(:to => "#{user.name} <#{user.email}>", :subject => "Password for Your Pholder Account")
  end
end
