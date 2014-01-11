# -*- encoding : utf-8 -*-
class FixDeaneryFiles < ActiveRecord::Migration
	def up
  		add_column :deanery_files, :admin_id, :integer
  	end

  	def down
  	end
 end
