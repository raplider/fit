class User < ActiveRecord::Base
  
  attr_accessible :firstname, :midlename, :lastname, :position, :department, :password
  
end
