class User < ApplicationRecord
	has_secure_password

	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	
	validates :password, :presence => true,
	:confirmation => true,
	:length => {:within => 6..40}
end
