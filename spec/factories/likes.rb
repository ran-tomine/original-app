FactoryBot.define do
  factory :like do
    association :user
    association :childcare
  end
end
