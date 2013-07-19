class RemovalPreferences < ActiveRecord::Base
  attr_accessible :name, :preference
  has_many :work_order
end
