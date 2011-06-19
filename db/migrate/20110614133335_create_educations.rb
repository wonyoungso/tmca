# -*- encoding : utf-8 -*-
class CreateEducations < ActiveRecord::Migration
  def self.up
    create_table :educations do |t|
      
        t.string :title
        t.text :description
        t.integer :bigphoto_file_size
        t.string :bigphoto_file_name
        t.string :bigphoto_content_type
        t.datetime :bigphoto_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :educations
  end
end
