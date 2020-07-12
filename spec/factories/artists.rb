FactoryBot.define do

  factory :PUNPEE, class: Artist do
    name { "PUNPEE" }
    image { Rack::Test::UploadedFile.new(Rails.root.join( 'app/assets/images/test.png'), 'image/png') }
    profile { "Favorite artist!!!!!!!!" }
  end

  factory :vava, class: Artist do
    name { "vava" }
    image { Rack::Test::UploadedFile.new(Rails.root.join( 'app/assets/images/test.png'), 'image/png') }
    profile { "Favorite artist!!!!!!!! vava" }
  end

end