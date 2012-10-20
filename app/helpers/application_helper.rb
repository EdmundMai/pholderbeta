module ApplicationHelper

  def complete_title(title)
  	base_title = "Pholder"
  	if title.empty?
  	  base_title
  	else
  	  "#{base_title} | #{title}"
  	end
  end

  def user_name(user)
  	if current_user == user
  	  "Your"
  	else
  	  "#{user.name}'s"
  	end
  end

  def profilepic?
    if self.profilepic != nil
      true
    else
      false
    end
  end

  def show_username
    if current_user == @user
      "Welcome back, #{current_user.name}!".html_safe
    else
      "#{@user.name}'s Page".html_safe
    end
  end

end
