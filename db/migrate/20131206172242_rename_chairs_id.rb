# -*- encoding : utf-8 -*-
class RenameChairsId < ActiveRecord::Migration
	def change
		rename_column :posts, :chairs_id, :chair_id
	end
end
