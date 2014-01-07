class FixPosts < ActiveRecord::Migration
  def up
  	add_column :posts, :department, :string
  	rename_column :posts, :user_id, :admin_id
  end

  def down
  	remove_column :posts, :department
  	rename_column :posts, :admin_id, :user_id
  end
end
