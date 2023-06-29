FactoryBot.define do
  factory :childcare do
    title {Faker::Lorem.word}
    diary {Faker::Lorem.sentence}
    association :user
    
    after(:build) do |childcare|
      childcare.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
