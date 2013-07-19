class WorkOrder < ActiveRecord::Base
  attr_accessible :after_photo, :before_photo, :completed_date, :discount, 
  				  :removal_preferences_id, :due_date, :snow_depth_id, :invliced,
  				  :notify, :paid, :property_id, :deice_sidewalk, :price, :due_before

	belongs_to :property
	belongs_to :removal_preferences
	belongs_to :snow_depth

	has_attached_file :before_photo, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }
	has_attached_file :after_photo,:styles => { :large => "600x600>" , :medium => "300x300>", :thumb => "100x100>" }

	def due_date_f
		Time.parse(due_date).strftime("%a, %B %d before %I:%M %p")
	end

end
