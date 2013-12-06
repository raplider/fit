class AddFormOfStudyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :form_of_study, :strings
  end
end
