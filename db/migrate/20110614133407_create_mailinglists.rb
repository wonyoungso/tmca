# -*- encoding : utf-8 -*-
class CreateMailinglists < ActiveRecord::Migration
  def self.up
    create_table :mailinglists do |t|
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :mailinglists
  end
end
