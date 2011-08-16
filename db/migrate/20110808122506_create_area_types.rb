class CreateAreaTypes < ActiveRecord::Migration
  def self.up
    create_table :area_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :area_types
  end
end
