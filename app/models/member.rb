class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :omniauthable, omniauth_providers: %i[twitter]
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :comments, dependent: :destroy

  mount_uploader :image, MemberUploader

  validates :image, presence: true
  validates :name, presence: true, length: {minimum:1, maximum:20}, uniqueness: true
  validates :profile, presence: true, length: { maximum: 200 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  #ゲストログイン
  def self.guest
    find_or_create_by(email: 'guest@example.com') do |member|
      member.password = SecureRandom.urlsafe_base64
    end
  end

  def self.find_for_oauth(auth)
    member = Member.where(uid: auth.uid, provider: auth.provider).first

#Twitterログイン
    unless member
      member = Member.new(
        uid:      auth.uid,
        provider: auth.provider,
        email:    Member.dummy_email(auth),
        password: Devise.friendly_token[0, 20],
        name: auth.info.name,
        nickname: auth.info.nickname,
        profile: auth.info.description
      )
      member.remote_image_url = auth.info.image
      member.save!
    end

    member
  end

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
end
#ここまで

#通知機能
has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
#ここまで

end
