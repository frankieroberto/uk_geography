class CreateOtherNames < ActiveRecord::Migration
  def self.up
    create_table :other_names do |t|
      t.string :name
      t.integer :area_id

      t.timestamps
    end
  end

  def self.down
    drop_table :other_names
  end
end
