class Post < ApplicationRecord
	validates :title, presence: true, length: { maximum: 255 }
	validates :body, presence: true, length: { maximum: 65535 }

	belongs_to :user
	has_many :praises, dependent: :destroy

	mount_uploader :post_image, PostImageUploader

	def self.ransackable_attributes(auth_object = nil)
    %w[title body deadline]
	end

	def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

end
