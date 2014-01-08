# -*- encoding : utf-8 -*-
class Admin < ActiveRecord::Base

  attr_accessible :firstname, :middlename, :lastname, :position, :department, :password
  
  validates :firstname, :presence => true
  validates :middlename, :presence => true
  validates :lastname, :presence => true
  validates :position, :presence => true
  validates :department, :presence => true
  validates :password,  :presence => true

  has_many :posts
  has_many :deanery_files
  
  # Повертає ПІБ
  def full_name
    return [lastname, firstname, middlename].join(' ')
  end

  # Метод для логіну, параметри - хеш з ім’ям та паролем
  def self.login(user)
  	user =  find_by_lastname_and_password(user[:lastname], 
  										  user[:password])
  	return user
  end
end
