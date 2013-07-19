class SnowDepth < ActiveRecord::Base
  attr_accessible :name, :inches
  has_many :work_order
end
