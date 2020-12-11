module SetDefaultTitleConcern
  extend ActiveSupport::Concern

  included do 
    before_action :set_default_title
  end

  def set_default_title
    @page_title = "Will Campbell | My Portfolio Website"
    @seo_keywords = "Will Campbell Portfolio"
  end
end