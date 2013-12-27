class Post < ActiveRecord::Base
  belongs_to :user
  has_attached_file :file
  validates_attachment :file,
    :content_type => {:content_type => ["application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "application/pdf", "text/plain"] }
end