class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :post
  validates :content, presence: true, length: { maximum: 65_535 }
end
