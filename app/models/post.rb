# -*- encoding : utf-8 -*-
class Post < ActiveRecord::Base
  	belongs_to :admin

  	attr_accessible :title, :body, :file, :category, :form_of_study

  	has_attached_file :file
  	validates_attachment :file,
    :content_type => {:content_type => ["application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "application/pdf", "text/plain"] }
	
    validates :title, :body, :presence => true

	default_scope :order => 'posts.created_at DESC'
	self.per_page = 2
end
