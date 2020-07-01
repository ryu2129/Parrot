class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :omniauthable, omniauth_providers: %i[twitter]
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :image, MemberUploader
  validates :profile, length: { maximum: 200 }


  def self.guest
    find_or_create_by(email: 'guest@example.com') do |member|
      member.password = SecureRandom.urlsafe_base64
    end
  end

  def self.find_for_oauth(auth)
    member = Member.where(uid: auth.uid, provider: auth.provider).first


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

end
