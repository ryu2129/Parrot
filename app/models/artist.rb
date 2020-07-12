class Artist < ApplicationRecord
  has_many :posts, dependent: :destroy
  mount_uploader :image, ArtistUploader

  def self.search(search)
  return Artist.all() unless search
  Artist.where('name LIKE(?)', "%#{search}%")
  end
end
