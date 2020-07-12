require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @taka = FactoryBot.create(:taka)
    @PUNPEE = FactoryBot.create(:PUNPEE)
    @post = FactoryBot.create(:post, member: @taka, artist: @PUNPEE )
  end

  context "投稿が有効であるとき" do
    it "有効な投稿である" do
      expect(@post).to be_valid
    end
  end

  context "投稿が無効であるとき" do
    it "ユーザーidが存在しない" do
      @post.member_id = ""
      expect(@post).not_to be_valid
    end

    it "ライブ詳細が存在しない" do
      @post.introduction = ""
      expect(@post).not_to be_valid
    end

    it "アーティストが存在しない" do
      @post.artist_id = ""
      expect(@post).not_to be_valid
    end

    it "ライブ名が存在しない" do
      @post.title = ""
      expect(@post).not_to be_valid
    end

    it "フライヤーが存在しない" do
      @post.image = ""
      expect(@post).not_to be_valid
    end

    it "会場が存在しない" do
      @post.address = ""
      expect(@post).not_to be_valid
    end

    it "日程が存在しない" do
      @post.schedule = ""
      expect(@post).not_to be_valid
    end

    it "視聴方法が存在しない" do
      @post.watching_method = ""
      expect(@post).not_to be_valid
    end

    it "詳細URLが存在しない" do
      @post.detailed_url = ""
      expect(@post).not_to be_valid
    end

    it "料金が存在しない" do
      @post.admission = ""
      expect(@post).not_to be_valid
    end

  end
end