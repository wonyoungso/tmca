class ChangeTextTypeToExhibitions < ActiveRecord::Migration
  def up
    change_column :exhibitions, :description, :text, :limit => 4294967295
  end

  def down
    change_column :exhibitions, :description, :text, :limit => 65535
  end
end
