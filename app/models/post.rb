class Post < ApplicationRecord
	validates :title, presence: true, length: { maximum: 255 }
	validates :body, presence: true, length: { maximum: 65535 }

	belongs_to :user
	has_many :praises

	mount_uploader :post_image, PostImageUploader

	def self.ransackable_attributes(auth_object = nil)
    %w[title body deadline]
	end

	def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

	def praises_by?(user)
		praises.exists?(user_id: user.id)
	end
end
