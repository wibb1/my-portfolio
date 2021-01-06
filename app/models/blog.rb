class Blog < ApplicationRecord

  default_scope { order(created_at: :desc) }

  enum status: { draft: 0, published: 1, featured: 3 }
  extend FriendlyId 
  friendly_id :title, use: :slugged

  validates_presence_of :title, :body

  belongs_to :topic, optional: true #remove the ", optional: true" later when you add topic to the blog entry

  has_many :comments, dependent: :destroy

  def self.special_blogs
    all
  end

  def self.featured_blogs
    limit(2)
  end
end
