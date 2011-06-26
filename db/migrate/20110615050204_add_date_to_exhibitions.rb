# -*- encoding : utf-8 -*-
class AddDateToExhibitions < ActiveRecord::Migration
  def self.up
    add_column :exhibitions, :start_date, :datetime
    add_column :exhibitions, :end_date, :datetime
    add_column :exhibitions, :published, :boolean, :default => false
  end

  def self.down
    remove_column :exhibitions, :start_date
    remove_column :exhibitions, :end_date
    remove_column :exhibitions, :published
  end
end
