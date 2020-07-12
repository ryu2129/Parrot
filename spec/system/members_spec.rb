require 'rails_helper'

def login_member
  @taka = FactoryBot.create(:taka)
  post "/members/sign_in", params: {
    email: @taka.email,
    password: @taka.password
  }
end

RSpec.describe MembersController, type: :request do
  context "ログインしていない場合" do

    describe "GET posts#index" do
      it "リクエストが成功する" do
        get "/"
        expect(response.status).to eq 200
      end
    end

    describe "GET members/registrations#new" do
      it "リクエストが成功する" do
        get "/members/sign_up"
        expect(response.status).to eq 200
      end
    end

    describe "GET devise/sessions#new" do
      it "リクエストが成功する" do
        get "/members/sign_in"
        expect(response.status).to eq 200
      end
    end

    describe "GET members/registrations#new" do
      context "パラメータが妥当な場合" do
        it "リクエストが成功する" do
          post "/members/sign_up", params: {
            member: {
              name: "maimai",
              email: "maimai@example.com",
              password: "maimaimai"
            }
          }
          expect(response.status).to eq 302
        end

        it "新規登録できる" do
          expect do
            post "/members/sign_up", params: {
              member: {
                name: "maimai",
                email: "maimai@example.com",
                password: "maimaimai"
              }
            }
          end.to change(member, :count).by(1)
        end

        it "member IDがセッションに保存されている" do
          post "/members", params: {
            member: {
              name: "maimai",
              email: "maimai@example.com",
              password: "maimaimai"
            }
          }
          expect(session[:member_id]).to eq member.last.id
        end

        it "リダイレクトする" do
          post "/members", params: {
            member: {
              name: "maimai",
              email: "maimai@example.com",
              password: "maimaimai"
            }
          }
          expect(response).to redirect_to "/members/#{member.last.id}"
        end
      end

      context "パラメータが不正な場合" do
        it "リクエストが成功する" do
          post "/members", params: {
            member: {
              name: "",
              email: "",
              password: "aaa"
            }
          }
          expect(response.status).to eq 200
        end

        it "新規登録されない" do
          expect do
            post "/members", params: {
            member: {
              name: "",
              email: "",
              password: "aaa"
            }
          }
          end.to_not change(member, :count)
        end

        it "エラーメッセージが表示される" do
          post "/members", params: {
            member: {
              name: "",
              email: "",
              password: "aaa"
            }
          }
          expect(response.body).to include "パスワードは6文字以上で入力してください"
        end
      end

    end

    before do
      login_member
      delete "/members/sign_out"
    end

    describe "GET members#show" do
      it "リクエストが成功する" do
        get "/members/#{@taka.id}"
        expect(response.status).to eq 200
      end
    end

    describe "GET members#likes" do
      it "リクエストが成功する" do
        get "/members/#{@taka.id}/likes"
        expect(response.status).to eq 200
      end
    end

    describe "GET members#follows" do
      it "リクエストが成功する" do
        get "/members/#{@taka.id}/follows"
        expect(response.status).to eq 200
      end
    end

    describe "GET members#followers" do
      it "リクエストが成功する" do
        get "/members/#{@taka.id}/followers"
        expect(response.status).to eq 200
      end
    end

  end

  context "ログインしている場合" do

    before do
      login_member
    end

    describe "DELETE members#logout" do
      it "ログアウトできる" do
        delete "/logout"
        expect(is_logged_in?).to be_falsey
      end
    end

    describe "GET members#index" do
      before do
        @sato = FactoryBot.create(:sato)
      end

      it "リクエストが成功する" do
        get "/members"
        expect(response.status).to eq 200
      end

      it "ユーザー名が表示されている" do
        get "/members"
        expect(response.body).to include "Taka"
        expect(response.body).to include "Sato"
      end

    end

    describe "GET members#show" do
      context "ユーザーが存在する場合" do

        it "リクエストが成功する" do
          get "/members/#{@taka.id}"
          expect(response.status).to eq 200
        end

        it "ユーザー名が表示されている" do
          get "/members/#{@taka.id}"
          expect(response.body).to include("Taka")
        end
      end
    end

    describe "GET members#edit" do

      it "リクエストが成功する" do
        get "/members/#{@taka.id}/edit"
        expect(response.status).to eq 200
      end

      it "ユーザー名が表示されている" do
        get "/members/#{@taka.id}/edit"
        expect(response.body).to include "Taka"
      end

      it "メールアドレスが表示されている" do
        get "/members/#{@taka.id}/edit"
        # p member.last.id
        expect(response.body).to include "#{@taka.email}"
      end

    end

    describe "PUT members#update" do
      context "パラメータが妥当な場合" do
        it "リクエストが成功する" do
          put "/members/#{@taka.id}", params: {
            member: {
              name: "hogege", email: "hoge@hoge.com"
            }
          }
          expect(response.status).to eq 302
        end

        it "ユーザー名が更新される" do
          expect do
            put "/members/#{@taka.id}", params: {
              member: {
                name: "hogege", email: "hoge@hoge.com"
              }
            }
          end.to change { member.find(@taka.id).name }.from("Taka").to("hogege")
        end

        it "自己紹介文が更新される" do
          expect do
            put "/members/#{@taka.id}", params: {
              member: {
                name: "hogege", email: "hoge@hoge.com", intro: "よろしくね〜"
              }
            }
          end.to change { member.find(@taka.id).intro }.from(nil).to("よろしくね〜")
        end

        it "リダイレクトする" do
          put "/members/#{@taka.id}", params: {
            member: {
              name: "hogege", email: "hoge@hoge.com"
            }
          }
          expect(response).to redirect_to "/members/#{@taka.id}"
        end
      end

      context "パラメータが不正な場合" do
        it "リクエストが成功する" do
          put "/members/#{@taka.id}", params: {
            member: {
              name: "", email: "hoge@hoge.com"
            }
          }
          expect(response.status).to eq 200
        end

        it "ユーザー名が変更されない" do
          expect do
            put "/members/#{@taka.id}", params: {
              member: {
                name: "", email: "hoge@hoge.com"
              }
            }
          end.to_not change(member.find(@taka.id), :name)
        end

        it "メールアドレスが変更されない" do
          expect do
            put "/members/#{@taka.id}", params: {
              member: {
                name: "hoge", email: ""
              }
            }
          end.to_not change(member.find(@taka.id), :email)
        end
      end
    end

  end
end