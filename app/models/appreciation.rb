class Appreciation < ActiveRecord::Base
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "150x150>" }#,:xsh=>"50x50>"}

  belongs_to :category

end
