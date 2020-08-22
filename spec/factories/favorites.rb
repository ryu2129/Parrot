FactoryBot.define do
  factory :favorite do
    association :member
    association :post
  end
end