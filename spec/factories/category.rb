FactoryBot.define do
  factory :category do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "test_name#{n}" }
  end
end
