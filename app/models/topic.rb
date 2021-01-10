class Topic < ApplicationRecord
  validates_presence_of :title

  has_many :blogs

  def destroy
    raise "Cannot delete topic with blogs" unless blogs.count == 0
    super
  end

  def self.topics_filter(params_page, per)
    page(params_page).per(per)
  end


end
