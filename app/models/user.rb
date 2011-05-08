class User < ActiveRecord::Base
  has_many :orders
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 

  def is_admin?
    User.all.any? ? (self == User.first || self.admin?): true
  end
end
