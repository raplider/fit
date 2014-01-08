class DeaneryFile < ActiveRecord::Base
	belongs_to :admin
  	has_attached_file :file
  	validates_attachment :file,
    :content_type => {:content_type => ["application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "application/pdf", "text/plain"] }
	default_scope :order => 'deanery_files.created_at DESC'
	self.per_page = 2
end
