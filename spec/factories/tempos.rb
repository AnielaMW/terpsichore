FactoryBot.define do
  factory :tempo do
    sequence(:name) { |n| "Tempo #{n}" }
    description "Tempo Description."
  end
end
