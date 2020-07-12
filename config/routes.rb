Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "posts#index"

  devise_for :members, controllers: {
    registrations: 'members/registrations',
    passwords: 'members/passwords',
    omniauth_callbacks: 'members/omniauth_callbacks'
  }

  #Twitterログイン
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  #ゲストログイン
  devise_scope :member do
    post '/members/guest_sign_in', to: 'members/sessions#new_guest'
  end

  #お気に入り
  get 'posts/fav/:id' => 'posts#fav', as: "fav_posts"
  resources :members, only: [:show, :create, :update] do
    collection do
      get :favorites
    end
  end

  #コメント
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  #インクリメンタルサーチ
  resources :artists, only: [:index, :show] do
    collection do
      get 'search'
    end
  end

end
