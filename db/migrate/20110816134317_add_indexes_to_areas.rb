class AddIndexesToAreas < ActiveRecord::Migration
  def self.up
    add_index :areas, :name
    add_index :areas, [:name, :area_type_id]
  end

  def self.down
    remove_index :areas, :column => [:name, :area_type_id]
    remove_index :areas, :name
  end
end