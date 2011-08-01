# -*- encoding : utf-8 -*-
class AddPolymorphicToPicturesPdfs < ActiveRecord::Migration
  def self.up
    add_column :pictures, :pictureable_id, :integer
    add_column :pictures, :pictureable_type, :string
    add_column :pdfs, :pdfable_id, :integer
    add_column :pdfs, :pdfable_type, :string
  end

  def self.down
    remove_column :pictures, :pictureable_id
    remove_column :pictures, :pictureable_type
    remove_column :pdfs, :pdfable_id
    remove_column :pdfs, :pdfable_type
  end
end
