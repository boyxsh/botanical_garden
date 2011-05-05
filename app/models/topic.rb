class Topic < ActiveRecord::Base
  belongs_to :forum
  has_many :posts
  accepts_nested_attributes_for :posts

  def get_first_post_title
    self.get_first_post.body
  end
  def self.get_first_post
    self.posts.first
  end
end
