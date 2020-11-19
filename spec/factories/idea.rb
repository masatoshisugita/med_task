FactoryBot.define do
  factory :idea do
    sequence(:body) { |n| "body#{n}" }
    association :category
  end
end
