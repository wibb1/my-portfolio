class Topic < ApplicationRecord
  validates_presence_of :title

  has_many :blogs

  def destroy
    raise "Cannot delete topic with blogs" unless blogs.count == 0
    super
  end
end
