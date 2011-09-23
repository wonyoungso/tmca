class CreateCurrents < ActiveRecord::Migration
  def self.up
    create_table :currents do |t|
      t.integer :exhibition_id
      t.integer :idex

      t.timestamps
    end
  end

  def self.down
    drop_table :currents
  end
end
