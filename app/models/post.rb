class Post < ApplicationRecord
	validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 65535 }

	belong_to :user
end
