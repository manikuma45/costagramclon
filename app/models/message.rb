class Message < ApplicationRecord
	has_many :favorites, dependent: :destroy
	has_many :favorite_users, through: :favorites, source: :user
	mount_uploader :image, ImageUploader
	belongs_to :user
end
