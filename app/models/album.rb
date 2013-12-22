# encoding: utf-8
class Album < ActiveRecord::Base
  attr_accessible :title
  has_many :photos, :dependent => :destroy

  validates :title, :presence => true
  
  default_scope :order => 'albums.created_at DESC'
  
  self.per_page = 12
end
