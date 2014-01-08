# -*- encoding : utf-8 -*-
class AddAttachmentFileToDeaneryFiles < ActiveRecord::Migration
  def self.up
    change_table :deanery_files do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :deanery_files, :file
  end
end

