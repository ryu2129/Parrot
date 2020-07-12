class Comment < ApplicationRecord
  belongs_to :member
  belongs_to :post
  validates :content, presence: true, length: { maximum: 140 }
end
