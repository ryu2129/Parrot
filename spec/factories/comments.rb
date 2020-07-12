FactoryBot.define do
  factory :comment, class: Comment do
    content { "This is comment. Love LIVE!!" }
    association :member
    association :post
  end
end