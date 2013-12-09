class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :position
      t.string :department
      t.string :password

      t.timestamps
    end
  end
end
