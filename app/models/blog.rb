class Blog < ApplicationRecord

  default_scope { order(created_at: :desc) }
  scope :user_blogs, -> { where(status: [:published, :featured]) }

  enum status: { draft: 0, published: 1, featured: 3 }
  extend FriendlyId 
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body, :topic_id

  belongs_to :topic

  has_many :comments, dependent: :destroy

  def self.special_blogs
    all
  end

  def self.blogs_filter(role, params_page, per)
    if role == :site_admin
      page(params_page).per(per)
    else
      user_blogs.page(params_page).per(per)
    end
  end
end
