FactoryGirl.define do
  factory :dance_direction, aliases: [:dd] do
    dance
    sequence(:sequence) { |n| n.to_s }
    sequence(:movement) { |n| "two hand turn your partner #{n} times" }

    factory :opt_direction, aliases: [:dod] do
      sequence(:mark) { |n| n.to_s }
      sequence(:measure) { |n| n.to_s }
      sequence(:position) { |n| "m#{n}-w#{n}" }
    end
  end
end
