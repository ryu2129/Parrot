class Post < ApplicationRecord

  belongs_to :member
  belongs_to :artist
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :member_id,  presence: true
  validates :artist_id, presence: true
  validates :title, presence: true
  validates :image, presence: true
  validates :address, presence: true
  validates :introduction, presence: true
  validates :schedule, presence: true
  validates :detailed_url, presence: true
  validates :admission, presence: true
  mount_uploader :image, PostUploader

  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end
end
