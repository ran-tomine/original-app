FactoryBot.define do
  factory :event do
    name {Faker::Lorem.word}
    location {Faker::Lorem.word}
    datetime { DateTime.now }
    description {Faker::Lorem.sentence}
    association :user
    
    after(:build) do |event|
      event.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
