class Topic < ActiveRecord::Base
  belongs_to :forum
  has_many :posts
  accepts_nested_attributes_for :posts
#
#    @@all_topic_views = 0
#    attr_accessor :self_topic_views
#def initialize
#
#  en
#  def set_all_topic_views
#    p "---------------------------------"
#     p @@all_topic_views
#    @@all_topic_views +=1
#    p @@all_topic_views
#  end
#
#  def set_self_topic_views
#    @self_topic_views = 0
#    @self_topic_views +=1
#    set_all_topic_views
#  end
#
#  def get_all_topic_views
#    @@all_topic_views
#  end
#  def get_self_topic_views
#    @self_topic_views
#  end

  def get_first_post_title
    self.get_first_post.body
  end
  def self.get_first_post
    self.posts.first
  end
end
