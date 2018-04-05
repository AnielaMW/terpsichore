FactoryBot.define do
  factory :dance_level do
    sequence(:name) { |n| "Level #{n}" }
    description "Level Description."
  end
end
