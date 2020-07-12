# frozen_string_literal: true

require 'rails_helper'

describe 'ユーザー権限のテスト' do

  before do
    @taka = FactoryBot.create(:taka, email: "taka@example.com")
  end

  describe 'ログインしていない場合' do
    context '投稿関連のURLにアクセス' do
      it '編集画面に遷移できない' do
        visit edit_post_path(post.id)
        expect(current_path).to eq('/members/sign_in')
      end
    end
  end
  describe 'ログインしていない場合にユーザー関連のURLにアクセス' do
    context 'ユーザー関連のURLにアクセス' do
      it '編集画面に遷移できない' do
        visit edit_member_registration_path(member.id)
        expect(current_path).to eq('/members/sign_in')
      end
      it '詳細画面に遷移でない' do
        visit member_path(member.id)
        expect(current_path).to eq('/members/sign_in')
      end
    end
  end
end
