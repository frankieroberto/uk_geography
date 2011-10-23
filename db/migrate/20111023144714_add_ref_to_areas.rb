class AddRefToAreas < ActiveRecord::Migration
  def self.up
    add_column :areas, :ref, :string
  end

  def self.down
    remove_column :areas, :ref
  end
end
