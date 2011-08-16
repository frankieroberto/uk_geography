class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.integer :area_id
      t.integer :parent_id
      t.boolean :is_partial

      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
