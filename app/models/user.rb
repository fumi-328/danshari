class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line]

  validates :name, presence: true, uniqueness: true

  has_many :posts, dependent: :destroy
  has_many :praises, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :praise_posts, through: :praises, source: :post

  def social_profile(provider)
    social_profiles.select { |sp| sp.provider == provider.to_s }.first
  end

  def set_values(omniauth)
    return if provider.to_s != omniauth['provider'].to_s || uid != omniauth['uid']

    credentials = omniauth['credentials']
    info = omniauth['info']

    access_token = credentials['refresh_token']
    access_secret = credentials['secret']
    credentials = credentials.to_json
    name = info['name']
  end

  def set_values_by_raw_info(raw_info)
    self.raw_info = raw_info.to_json
    save!
  end

  def own?(post)
    id == post&.user_id
  end

  def total_praises
    Post.joins(:praises).where(user_id: id).count
  end

  def discard_complete_count
    posts.where(discard_flag: true).count
  end

  def praise(post)
    praise_posts << post
  end

  def unpraise(post)
    praise_posts.destroy(post)
  end

  def praise?(post)
    praise_posts.include?(post)
  end
end
