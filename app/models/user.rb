class User < ActiveRecord::Base
  has_many :posts
  attr_accessible :firstname, :middlename, :lastname, :position, :department, :password
  
  validates :firstname, :presence => true
  validates :middlename, :presence => true
  validates :lastname, :presence => true
  validates :position, :presence => true
  validates :department, :presence => true

  validates :password,  :presence => true
  
end
