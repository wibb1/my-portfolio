class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog

  validates :content, presence: true, length: { minimum: 4, maximum: 1000 }

  after_create_commit { CommentBrodcastJob.perfom_later(self) }
end
