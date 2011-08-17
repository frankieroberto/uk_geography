class AddIndexToLocations < ActiveRecord::Migration
  def self.up
    add_index :locations, :parent_id
  end

  def self.down
    remove_index :locations, :parent_id
  end
end