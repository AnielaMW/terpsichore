FactoryBot.define do
  factory :meter do
    sequence(:name) { |n| "#{n}/16" }
  end
end
