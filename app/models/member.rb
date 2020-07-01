class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
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
end
