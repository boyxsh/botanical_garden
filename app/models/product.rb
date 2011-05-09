class Product < ActiveRecord::Base
  has_attached_file :image,
  :styles => {
    :thumb  => "200x150#",
    :medium => "800x600>",
  }
  belongs_to :category
  has_many :orders
end
