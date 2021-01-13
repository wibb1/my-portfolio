module BlogsHelper
  def gravatar_helper user
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 40, class: "float-left"
  end

  def icon_helper(status)
    case status
    when 'featured'
      icon = 'bullhorn'
    when 'published'
      icon = 'toggle-on'
    when 'draft'
      icon = 'toggle-off'
    else
      icon = 'exclamation'
    end
    fa_icon(icon)
  end

  def button_helper(status, blog)
    case status
    when 'featured'
      icon = 'bullhorn'
      color = 'success'
    when 'published'
      icon = 'toggle-on'
      color = 'success'
    when 'draft'
      icon = 'toggle-off'
      color = 'outline-secondary'
    else
      icon = 'exclamation'
      color = 'danger'
    end
    link_to fa_icon(icon, title: "Current status: #{status.titleize}\nClick to change"), toggle_status_blog_path(blog), class: "btn btn-#{color} fa-2x"
  end

  def markdown(text)
    transformed = CodeRayImp.new(
      filter_html: true, 
      hard_wrap: true, 
      prettify: true, 
      link_attributes: true
      )
    
    markdown_options = {
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      disable_indented_code_blocks: true,
      superscript: true,
      underline: true,
      highlight: true,
      autolink: true,
      lax_html_blocks: true
    }

    markdown_text = Redcarpet::Markdown.new(Redcarpet::Render::HTML, markdown_options)
    markdown_text.render(text).html_safe
  end

  class CodeRayImp < Redcarpet::Render::HTML
    def code_block(code, language)
      language ||= :plaintext
      CodeRay.scan(code, language).div
    end
  end
end
