class Location < ActiveRecord::Base

  belongs_to :area
  belongs_to :parent, :class_name => "Area"

end
