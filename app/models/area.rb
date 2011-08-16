class Area < ActiveRecord::Base

  validates_presence_of :name, :area_type_id

  belongs_to :area_type

  has_many :locations
  has_many :parents, :through => :locations

  has_many :reverse_locations, :class_name => "Location", :foreign_key => :parent_id
  has_many :areas, :through => :reverse_locations
  has_many :other_names

  scope :regions, joins(:area_type).where(:area_types => {:name => "Region"})
  scope :post_code_areas, joins(:area_type).where(:area_types => {:name => "Postcode Area"})
  scope :post_code_districts, joins(:area_type).where(:area_types => {:name => "Postcode District"})

  accepts_nested_attributes_for :parents, :other_names

  def to_param
    name
  end

end
