class AddPrimaryKeyMailinglists < ActiveRecord::Migration
  def change
    add_column :mailinglists, :created_at, :datetime
    add_column :mailinglists, :updated_at, :datetime
  end  
end
