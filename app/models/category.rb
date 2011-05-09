class Category < ActiveRecord::Base
  has_many :appreciations
  has_many :products
end
