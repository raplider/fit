class User < ActiveRecord::Base
  
  attr_accessible :firstname, :middlename, :lastname, :position, :department, :password
  
end
