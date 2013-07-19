class User < ActiveRecord::Base
	has_secure_password
  attr_accessible :email, :password, :password_confirmation
  validates_uniqueness_of :email
  has_attached_file :profile_photo
end
