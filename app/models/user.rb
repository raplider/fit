class User < ActiveRecord::Base
  attr_accessible :firstname, :password
  has_many :photos, :dependent => :destroy
end
