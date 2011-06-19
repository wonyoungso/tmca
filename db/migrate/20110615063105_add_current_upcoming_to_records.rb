class AddCurrentUpcomingToRecords < ActiveRecord::Migration
  def self.up
    add_column :exhibitions, :current, :boolean, :default => false
    add_column :exhibitions, :upcoming, :boolean, :default => false
    add_column :educations, :current, :boolean, :default => false
    add_column :educations, :upcoming, :boolean, :default => false
    add_column :events, :current, :boolean, :default => false
    add_column :events, :upcoming, :boolean, :default => false
  end

  def self.down
    remove_column :exhibitions, :current
    remove_column :exhibitions, :upcoming
    remove_column :educations, :current
    remove_column :educations, :upcoming
    remove_column :events, :current
    remove_column :events, :upcoming
  end
end
