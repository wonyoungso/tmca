class AddAttachmentEngToExhibitions < ActiveRecord::Migration
  def self.up
    add_column :exhibitions, :attachment_eng_file_name, :string
    add_column :exhibitions, :attachment_eng_content_type, :string
    add_column :exhibitions, :attachment_eng_file_size, :integer
    add_column :exhibitions, :attachment_eng_updated_at, :datetime
    add_column :exhibitions, :category_id, :integer
  end

  def self.down
    remove_column :exhibitions, :attachment_eng_file_name
    remove_column :exhibitions, :attachment_eng_content_type
    remove_column :exhibitions, :attachment_eng_file_size
    remove_column :exhibitions, :attachment_eng_updated_at
    remove_column :exhibitions, :category_id
  end
end
