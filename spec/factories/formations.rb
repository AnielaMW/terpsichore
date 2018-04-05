FactoryBot.define do
  factory :formation do
    sequence(:name) { |n| "#{n} couple set" }
    description "6 people in two lines"
  end
end
