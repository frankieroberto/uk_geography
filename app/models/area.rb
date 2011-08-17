class Area < ActiveRecord::Base

  validates_presence_of :name, :area_type_id

  belongs_to :area_type

  has_many :locations
  has_many :parents, :through => :locations

  has_many :reverse_locations, :class_name => "Location", :foreign_key => :parent_id
  has_many :areas, :through => :reverse_locations
  has_many :other_names

  scope :regions, joins(:area_type).where(:area_types => {:name => "Region"})
  scope :postcode_areas, joins(:area_type).where(:area_types => {:name => "Postcode Area"})
  scope :postcode_districts, joins(:area_type).where(:area_types => {:name => "Postcode District"})
  scope :unitary_authorities, joins(:area_type).where(:area_types => {:name => "Unitary Authority"})
  scope :countries, joins(:area_type).where(:area_types => {:name => "Country"})
  scope :regions_or_countries, joins(:area_type).where(:area_types => {:name => ["Country", "Region"]}).where(["areas.name <> ?", "England"])
  scope :top_tier_local_authorities, joins(:area_type).where(:area_types => {:name => ["Unitary Authority", "County", "Metropolitan District", "London Borough", "Scottish Council Area"]})

  accepts_nested_attributes_for :parents, :other_names

  def to_param
    name
  end

end
