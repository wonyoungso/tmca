# -*- encoding : utf-8 -*-
class AddSomethingToEducations < ActiveRecord::Migration
  def self.up
    add_column :educations, :start_date, :datetime
    add_column :educations, :end_date, :datetime
    add_column :educations, :published, :boolean, :default => false
  end

  def self.down
    remove_column :educations, :start_date
    remove_column :educations, :end_date
    remove_column :educations, :published
  end
end
