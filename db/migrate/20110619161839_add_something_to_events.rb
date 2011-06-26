# -*- encoding : utf-8 -*-
class AddSomethingToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :start_date, :datetime
    add_column :events, :end_date, :datetime
  end

  def self.down
    remove_column :events, :start_date
    remove_column :events, :end_date
  end
end
