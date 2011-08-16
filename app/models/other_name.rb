class OtherName < ActiveRecord::Base

  belongs_to :area
  validates_presence_of :name, :area_id

end
