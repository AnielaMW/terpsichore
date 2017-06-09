FactoryGirl.define do
  factory :mood do
    sequence(:name) { |n| "Mood #{n}" }
  end
end
