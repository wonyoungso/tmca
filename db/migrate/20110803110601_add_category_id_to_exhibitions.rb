# -*- encoding : utf-8 -*-
class AddCategoryIdToExhibitions < ActiveRecord::Migration
  def self.up
    add_column :exhibitions, :category_id, :integer
  end

  def self.down
    remove_column :exhibitions, :category_id
  end
end
