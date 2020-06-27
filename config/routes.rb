Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: "posts#index"
  devise_for :members, controllers: {
    registrations: 'members/registrations',
    passwords: 'members/passwords'
  }
  devise_scope :member do
    post '/members/guest_sign_in', to: 'members/sessions#new_guest'
  end

  get 'abouts/about'
  resources :posts
  resources :artists, only: [:index, :show]
end
