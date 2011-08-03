# -*- encoding : utf-8 -*-
class AddAttachmentEngToExhibitions < ActiveRecord::Migration
  def self.up
    add_column :news, :attachment_eng_file_name, :string
    add_column :news, :attachment_eng_content_type, :string
    add_column :news, :attachment_eng_file_size, :integer
    add_column :news, :attachment_eng_updated_at, :datetime
    add_column :news, :category_id, :integer
  end

  def self.down
    remove_column :news, :attachment_eng_file_name
    remove_column :news, :attachment_eng_content_type
    remove_column :news, :attachment_eng_file_size
    remove_column :news, :attachment_eng_updated_at
    remove_column :news, :category_id
  end
end
