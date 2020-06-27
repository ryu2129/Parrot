class Artist < ApplicationRecord
  has_many :posts, dependent: :destroy
  mount_uploader :image, ArtistUploader
end
