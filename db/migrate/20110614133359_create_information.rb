# -*- encoding : utf-8 -*-
class CreateInformation < ActiveRecord::Migration
  def self.up
    create_table :information do |t|
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :information
  end
end
