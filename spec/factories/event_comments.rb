FactoryBot.define do
  factory :event_comment do
    content {Faker::Lorem.sentence}
    association :user
    association :event
  end
end
