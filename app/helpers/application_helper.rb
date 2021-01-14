module ApplicationHelper
def guest_login_items
  [
    {
      url: new_user_registration_path,
      title: "Register"
    },
    {
      url: new_user_session_path,
      title: "Login"
    }
  ]
end

  def application_helper_login style = '', tag_type 
    if current_user.is_a?(GuestUser)
      login_links = ''
      guest_login_items.each do |item|
        login_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
      end
  
      login_links.html_safe

      ##(link_to "Register", new_user_registration_path, class: style) 
      ##(link_to "Login", new_user_session_path, class: style)
    else
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    end
  end

  def application_helper_message
    greeting1 = "Thanks for connecting through #{session[:source]}!"
    greeting2 = "Thanks for joining me!"
    greeting_add = (session[:source].present? ? greeting1 : greeting2)
    content_tag(:p, greeting_add, class: "source-greeting")
  end

  def application_copyright_generator
    Wibb1ViewTool::Renderer.copyright 'Will Campbell', 'All rights reserved'
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_me_path,
        title: 'About Me'
      },
      {
        url: contact_path,
        title: 'Contact'
      },
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: portfolios_path,
        title: 'Portfolio'
      },
      {
        url: tech_news_path,
        title: 'Tech News'
      }
    ]
  end

  def application_helper_nav style, tag_type
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    if alert 
      alert_generator alert
    end
  end

  def alert_generator msg 
    js add_gritter(msg, title: "Will Campbell's Portfolio", sticky: false)
  end
end
