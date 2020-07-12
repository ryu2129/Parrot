FactoryBot.define do

  factory :taka, class: Member do
    name { "taka" }
    image { Rack::Test::UploadedFile.new(Rails.root.join( 'app/assets/images/test.png'), 'image/png') }
    profile { "testtesttesttesttesttesttesttest" }
    email { "taka@example.com"  }
    password { "takatakataka" }
  end

  factory :hiro, class: Member do
    name { "hiro" }
    image { Rack::Test::UploadedFile.new(Rails.root.join( 'app/assets/images/test.png'), 'image/png') }
    profile { "hirohirohirohirohirohiro" }
    email { "hiro@example.com"  }
    password { "hirohirohiro" }
  end
end