require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @taka = FactoryBot.create(:taka)
    @PUNPEE = FactoryBot.create(:PUNPEE)
    @post = FactoryBot.create(:post, member: @taka, artist: @PUNPEE )
    @comment = FactoryBot.create(:comment, post: @post, member: @taka )
  end

  context "有効なコメント" do
    it "コメントが有効である" do
      expect(@comment).to be_valid
    end
  end

  context "無効なコメント" do
    it "コメント内容が存在しない" do
      @comment.content = ""
      expect(@comment).not_to be_valid
    end

    it "コメント内容が141文字以上である" do
      @comment.content = "a"*141
      expect(@comment).not_to be_valid
    end

    it "ユーザーidが存在しない" do
      @comment.member_id = ""
      expect(@comment).not_to be_valid
    end

    it "投稿idが存在しない" do
      @comment.post_id = ""
      expect(@comment).not_to be_valid
    end
  end
end