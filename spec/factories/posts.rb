FactoryBot.define do
  factory :post do
    title { "postlive" }
    introduction { "This is post live" }
    image { Rack::Test::UploadedFile.new(Rails.root.join( 'app/assets/images/test.png'), 'image/png') }
    schedule { Faker::Date.between(from: '2020-07-16', to: '2020-07-25') }
    address { "tokyo" }
    watching_method { 1 }
    detailed_url { "https://www.google.com/" }
    admission { 1000 }
    association :artist
    association :member
  end
end
