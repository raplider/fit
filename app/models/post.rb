# -*- encoding : utf-8 -*-
class Post < ActiveRecord::Base
  
  	belongs_to :admin

  	attr_accessible :title, :body, :file, :category, :form_of_study

  	validates :title, :body, :presence => true

  	has_attached_file :file
  	validates_attachment :file,
    :content_type => {:content_type => ["application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "application/pdf", "text/plain"] }

	default_scope :order => 'posts.created_at DESC'

	self.per_page = 4
	
end
