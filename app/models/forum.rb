class Forum < ActiveRecord::Base
  has_many :topics
  has_many :posts, :order => "updated_at", :through => :topics
  accepts_nested_attributes_for :topics

  def get_latest_posted_topic
    return nil if self.posts.blank?
    self.posts.last.topic
  end
end
