# -*- encoding : utf-8 -*-
class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :body

      t.timestamps
    end

    # Create initial values
    Page.create(name: "deanery")
    Page.create(name: "iust")
    Page.create(name: "pzas")
    Page.create(name: "zmi")
  end
end
