class User < ApplicationRecord
	has_many :messages
	mount_uploader :profile_image, ProfileImageUploader
	validates :name,  presence: true, length: { maximum: 30 }
	validates :email, presence: true, length: { maximum: 255 }
   before_validation { email.downcase! }
   has_secure_password
   validates :password, presence: true, length: { minimum: 6 }
end
