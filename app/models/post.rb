class Post < ApplicationRecord

  belongs_to :member
  belongs_to :artist
  validates :artist_id, presence: true
  validates :title, presence: true
  validates :introduction, presence: true
  validates :schedule, presence: true
  validates :detailed_url, presence: true
  validates :admission, presence: true
  mount_uploader :image, PostUploader
end
