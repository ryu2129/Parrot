# frozen_string_literal: true

require 'rails_helper'

describe 'ヘッダーのテスト' do
  describe 'ログインしていない場合' do
    before do
      visit root_path
    end
    context 'ヘッダーの表示を確認' do
      subject { page }
      it 'タイトルが表示される' do
        is_expected.to have_content 'Parrot'
      end
      it 'Postリンクが表示される' do
        post_link = find_all('a')[0].native.inner_text
        expect(post_link).to match(/post/i)
        # is_expected.to have_content 'post'
      end
      it 'Artistリンクが表示される' do
        artist_link = find_all('a')[1].native.inner_text
        expect(artist_link).to match(/Artist/i)
        # is_expected.to have_content 'artist'
      end
      it 'Sign upリンクが表示される' do
        signup_link = find_all('a')[2].native.inner_text
        expect(signup_link).to match(/sign up/i)
        # is_expected.to have_content 'Sign up'
      end
      it 'Log inリンクが表示される' do
        login_link = find_all('a')[3].native.inner_text
        expect(login_link).to match(/login/i)
        # is_expected.to have_content 'login'
      end
    end
    context 'ヘッダーのリンクを確認' do
      subject { current_path }
      it 'post画面に遷移する' do
        post_link = find_all('a')[0].native.inner_text
        post_link = post_link.delete(' ')
        post_link.gsub!(/\n/, '')
        click_link post_link
        is_expected.to eq(new_post_path)
      end
      it 'artist画面に遷移する' do
        artist_link = find_all('a')[1].native.inner_text
        artist_link = artist_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link artist_link
        is_expected.to eq(artists_path)
      end
      it '新規登録画面に遷移する' do
        signup_link = find_all('a')[2].native.inner_text
        signup_link = signup_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link signup_link
        is_expected.to eq(new_member_registration_path)
      end
      it 'ログイン画面に遷移する' do
        login_link = find_all('a')[3].native.inner_text
        login_link = login_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link login_link
        is_expected.to eq(new_member_session_path)
      end
    end
  end

  describe 'ログインしている場合' do
    let(:member) { create(:member) }
    before do
      visit new_member_session_path
      fill_in 'member[email]', with: member.email
      fill_in 'member[password]', with: member.password
      click_button 'Log in'
    end
    context 'ヘッダーの表示を確認' do
      subject { page }
      it 'タイトルが表示される' do
        is_expected.to have_content 'Parrot'
      end
      it 'postリンクが表示される' do
        post_link = find_all('a')[0].native.inner_text
        expect(post_link).to match(/post/i)
      end
      it 'artistリンクが表示される' do
        members_link = find_all('a')[1].native.inner_text
        expect(members_link).to match(/members/i)
      end
      it 'logoutリンクが表示される' do
        logout_link = find_all('a')[3].native.inner_text
        expect(logout_link).to match(/logout/i)
      end
    end

    context 'ヘッダーのリンクを確認' do
      subject { current_path }
      it 'post画面に遷移する' do
        post_link = find_all('a')[0].native.inner_text
        post_link = post_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link post_link
        is_expected.to eq('/members/' + member.id.to_s)
      end
      it 'artist画面に遷移する' do
        artist_link = find_all('a')[1].native.inner_text
        artist_link = artist_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link artist_link
        is_expected.to eq(artists_path)
      end
      it 'logoutする' do
        logout_link = find_all('a')[3].native.inner_text
        logout_link = logout_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link logout_link
        expect(page).to have_content 'Signed out successfully.'
      end
    end
  end
end