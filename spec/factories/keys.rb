FactoryBot.define do
  factory :key do
    sequence(:name) { |n| "Key #{n}" }
  end
end
