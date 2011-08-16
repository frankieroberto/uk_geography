class Area < ActiveRecord::Base

  validates_presence_of :name, :area_type_id

  belongs_to :area_type

  has_many :locations
  has_many :parents, :through => :locations

  has_many :reverse_locations, :class_name => "Location", :foreign_key => :parent_id
  has_many :areas, :through => :reverse_locations
  has_many :other_names

  accepts_nested_attributes_for :parents, :other_names

  def to_param
    name
  end

end
