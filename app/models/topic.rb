class Topic < ApplicationRecord
  validates_presence_of :title

  has_many :blogs, dependent: :restrict_with_error

  def self.topics_filter(params_page, per)
    page(params_page).per(per)
  end


end
