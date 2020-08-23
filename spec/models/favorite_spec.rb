require 'rails_helper'

RSpec.describe Favorite, type: :model do
  before do
    @taka = FactoryBot.create(:taka)
    @PUNPEE = FactoryBot.create(:PUNPEE)
    @post = FactoryBot.create(:post, member: @taka, artist: @PUNPEE)
    @favorite = FactoryBot.create(:favorite, member: @taka, post: @post)
  end

  context "有効ないいね" do
    it "いいねが有効である" do
      expect(@favorite).to be_valid
    end
  end

  context "無効ないいね" do
    it "ユーザーidが存在しない" do
      @favorite.member_id = ""
      expect(@favorite).not_to be_valid
    end

    it "投稿idが存在しない" do
      @favorite.post_id = ""
      expect(@favorite).not_to be_valid
    end

  end
end