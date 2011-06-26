# -*- encoding : utf-8 -*-
class ModifySaltTypeToUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :salt
    add_column :users, :salt, :string
  end

  def self.down
      remove_column :users, :salt
      add_column :users, :salt, :integer
    
  end
end
