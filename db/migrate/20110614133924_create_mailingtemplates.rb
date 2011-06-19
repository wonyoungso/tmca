# -*- encoding : utf-8 -*-
class CreateMailingtemplates < ActiveRecord::Migration
  def self.up
    create_table :mailingtemplates do |t|
      t.string :title
      t.text :description
      t.integer :vol
      t.timestamps
    end
  end

  def self.down
    drop_table :mailingtemplates
  end
end
