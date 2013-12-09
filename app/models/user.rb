class User < ActiveRecord::Base
  has_many :posts
  attr_accessible :firstname, :middlename, :lastname, :position, :department, :password
  
end
