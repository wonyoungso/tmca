# -*- encoding : utf-8 -*-
class AddPermalinkToExhibitions < ActiveRecord::Migration
  def self.up
    add_column :exhibitions, :permalink, :string
    add_column :educations, :permalink, :string
    add_column :events, :permalink, :string
  end

  def self.down
    remove_column :exhibitions, :permalink
    remove_column :educations, :permalink
    remove_column :events, :permalink
  end
end
