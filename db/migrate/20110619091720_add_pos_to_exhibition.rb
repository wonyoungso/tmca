class AddPosToExhibition < ActiveRecord::Migration
  def self.up
    add_column :exhibitions, :x1medium, :string
    add_column :exhibitions, :y1medium, :string
    add_column :exhibitions, :widthmedium, :string
    add_column :exhibitions, :heightmedium, :string
    
    add_column :exhibitions, :x1thumb, :string
    add_column :exhibitions, :y1thumb, :string
    add_column :exhibitions, :widththumb, :string
    add_column :exhibitions, :heightthumb, :string
    
  end

  def self.down
    
      remove_column :exhibitions, :x1medium
      remove_column :exhibitions, :y1medium
      remove_column :exhibitions, :widthmedium
      remove_column :exhibitions, :heightmedium
      
      remove_column :exhibitions, :x1thumb
      remove_column :exhibitions, :y1thumb
      remove_column :exhibitions, :widththumb
      remove_column :exhibitions, :heightthumb
  end
end
