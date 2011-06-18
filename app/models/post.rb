class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic

  after_create :after_create_set_name

  private
    def after_create_set_name
      email = self.user.email
      self.user.name ||= email[0,email.index('@')]
      self.user.save!
    end
end
