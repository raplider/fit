class CreateDeaneryFiles < ActiveRecord::Migration
  def change
    create_table :deanery_files do |t|
      t.string :name
      t.string :form_of_study

      t.timestamps
    end
  end
end
