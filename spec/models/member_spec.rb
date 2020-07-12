require 'rails_helper'

RSpec.describe Member, type: :model do

  before do
    @taka = FactoryBot.create(:taka, email: "taka@example.com")
  end

  context "ユーザーが有効であるとき" do
    it "有効なユーザーである" do
      expect(@taka).to be_valid
    end
  end

  context "ユーザーが無効であるとき" do
    it "ユーザー名が空である" do
      @taka.name = ""
      expect(@taka).not_to be_valid
    end

    it "ユーザー名が21文字以上である" do
      @taka.name = "a"*21
      expect(@taka).not_to be_valid
    end

    it "ユーザー名が重複する" do
      other_member = FactoryBot.build(:taka)
      expect(other_member).not_to be_valid
    end

    it "プロフィールが空である" do
      @taka.profile = ""
      expect(@taka).not_to be_valid
    end

    it "プロフィールが201文字以上である" do
      @taka.name = "a"*201
      expect(@taka).not_to be_valid
    end

    it "メールアドレスが空である" do
      @taka.email = ""
      expect(@taka).not_to be_valid
    end

    it "メールアドレスが重複する" do
      other_member = FactoryBot.build(:taka, email: "taka@example.com")
      expect(other_member).not_to be_valid
    end

    it "パスワードが存在しない" do
      @taka.password = ""
      expect(@taka).not_to be_valid
    end
  end

end