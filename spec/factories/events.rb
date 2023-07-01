FactoryBot.define do
  factory :event do
    name {Faker::Lorem.word}
    location {Faker::Lorem.word}
    datetime { "2100-01-01 00:00:00" }
    description {Faker::Lorem.sentence}
    association :user
    
    after(:build) do |event|
      event.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
