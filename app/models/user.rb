class User < ApplicationRecord
	has_many :favorites, dependent: :destroy
	mount_uploader :picture, PictureUploader
	has_many :messages
	validates :name,  presence: true, length: { maximum: 30 }
	validates :email, presence: true, length: { maximum: 255 }
   before_validation { email.downcase! }
   has_secure_password
   validates :password, presence: true, length: { minimum: 6 }
end
