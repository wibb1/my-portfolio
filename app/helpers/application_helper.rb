module ApplicationHelper
  def application_helper_login style
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to "Login", new_user_session_path, class: style)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def application_helper_message
    greeting = "Thanks for visiting me" 
    greeting_add = (session[:source].present? ? " from #{session[:source]}!" : "!")
    content_tag(:p, greeting + greeting_add, class: "source-greeting")
  end

  def application_copyright_generator
    Wibb1ViewTool::Renderer.copyright 'Will Campbell', 'All rights reserved'
  end
end
