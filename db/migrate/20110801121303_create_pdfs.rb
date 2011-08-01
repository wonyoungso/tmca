# -*- encoding : utf-8 -*-
class CreatePdfs < ActiveRecord::Migration
  def self.up
    create_table :pdfs do |t|
      t.integer :attachment_file_size
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.datetime :attachment_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :pdfs
  end
end
