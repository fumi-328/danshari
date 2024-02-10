class Post < ApplicationRecord
	validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65535 }

	belongs_to :user

	mount_uploader :post_image, PostImageUploader
end