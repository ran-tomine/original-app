FactoryBot.define do
  factory :childcare_comment do
    content {Faker::Lorem.sentence}
    association :user
    association :childcare
  end
end
