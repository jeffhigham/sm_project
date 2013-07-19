class DrivewayLength < ActiveRecord::Base
  attr_accessible :feet, :name
  has_many :properties
end
