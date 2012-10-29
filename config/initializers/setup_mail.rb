ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :user_name            => "edmundmai@gmail.com",
  :password             => "edmundosan",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "https://pacific-ravine-3563.herokuapp.com/"