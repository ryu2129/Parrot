class Favorite < ApplicationRecord
  belongs_to :member
  belongs_to :post

  validates :member_id, {presence: true}
  validates :post_id, {presence: true}
  validates_uniqueness_of :post_id, scope: :member_id
end
