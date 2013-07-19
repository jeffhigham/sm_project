class DrivewayType < ActiveRecord::Base
  attr_accessible :integer, :name, :property_id, :width
  has_many :properties
end
