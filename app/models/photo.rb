# encoding: utf-8
class Photo < ActiveRecord::Base
  attr_accessible :title, :photo, :album_id
  belongs_to :user
  belongs_to :album
  
  validates :title, :presence => true
  
  has_attached_file :photo,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  validates_attachment :photo, :presence => true,
                       :content_type => { :content_type => ["image/png", "image/jpg", "image/jpeg", "image/gif"],
                                          :message => "Тільки файли png, jpg, jpeg, gif"},
                       :size => { :in => 0..10240.kilobytes }
  
  default_scope :order => 'photos.created_at DESC'
  
  before_save :default_values
  def default_values
    self.vote = 0 unless self.vote
  end
  
  self.per_page = 6
end
