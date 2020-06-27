class Post < ApplicationRecord

  belongs_to :member
  validates :artist_id, presence: true
  validates :title, presence: true
  validates :introduction, presence: true
  validates :schedule, presence: true
  validates :detailed_url, presence: true
  validates :admission, presence: true
end
