class Property < ActiveRecord::Base
  attr_accessible :customer_id, :address, :city, :state, :zip, :primary, :driveway_length_id, :driveway_type_id, 
  								:sidewalk_length_id, :notes, :profile_photo_1, :profile_photo_2

	belongs_to :customer
	belongs_to :driveway_length
	belongs_to :driveway_type
	belongs_to :sidewalk_length
	has_many :work_orders, dependent: :destroy
	# http://railscasts.com/episodes/196-nested-model-form-revised
	accepts_nested_attributes_for :work_orders

	has_attached_file :profile_photo_1, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }
	has_attached_file :profile_photo_2,:styles => { :large => "600x600>" , :medium => "300x300>", :thumb => "100x100>" }

	acts_as_gmappable

	def gmaps4rails_address
		"#{self.address}, #{self.city}, #{self.state}, #{self.zip}"
	end

	def has_work_orders?
	  self.work_orders.where("paid IS NOT NULL AND completed_date IS NULL").count > 0
	end

	#def driveway_name
	#	DrivewayType.find(driveway_type).name
	#end

end
