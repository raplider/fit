# -*- encoding : utf-8 -*-
class RemoveChairIdFromPosts < ActiveRecord::Migration
  def up
    remove_column :posts, :chair_id
      end

  def down
    add_column :posts, :chair_id, :string
  end
end
