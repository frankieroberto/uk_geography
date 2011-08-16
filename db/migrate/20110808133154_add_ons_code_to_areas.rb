class AddOnsCodeToAreas < ActiveRecord::Migration
  def self.up
    add_column :areas, :ons_code, :string
    add_index :areas, :ons_code
  end

  def self.down
    remove_index :areas, :ons_code
    remove_column :areas, :ons_code
  end
end