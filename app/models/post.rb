class Post < ApplicationRecord

  belongs_to :member
  belongs_to :artist
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy
  validates :member_id,  presence: true
  validates :title, presence: true, length: {minimum:1}
  validates :image, presence: true
  validates :introduction, presence: true, length: {minimum:1}
  validates :address, presence: true
  validates :schedule, presence: true
  validates :watching_method, presence: true
  validates :detailed_url, presence: true
  validates :admission, presence: true
  mount_uploader :image, PostUploader

  def favorited_by?(member)
    favorites.where(member_id: member.id).exists?
  end

  def start_time
    self.schedule
  end

  #通知機能ここから
  def create_notification_favorite!(current_member)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_member.id, member_id, id, 'favorite'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_member.active_notifications.new(
        post_id: id,
        visited_id: member_id,
        action: 'favorite'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_comment!(current_member, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:member_id).where(post_id: id).where.not(member_id: current_member.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_member, comment_id, temp_id['member_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_member, comment_id, member_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_member, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_member.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
  #ここまで
end
