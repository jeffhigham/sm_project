class Customer < ActiveRecord::Base
  attr_accessible :billing, :email, :home_phone, :mobile_phone, :password, :password_confirmation,
  								:profile_photo
  validates_uniqueness_of :email
  has_secure_password
  has_attached_file :profile_photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :properties, dependent: :destroy

  def has_work_orders?
  	self.properties.each do |property|
  		return true if property.has_work_orders?
  	end
  		return false
  end


end
