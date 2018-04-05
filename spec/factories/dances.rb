FactoryBot.define do
  factory :dance do
    user
    sequence(:title) { |n| "Dance Title #{n}" }
    meter
    formation
    key
    tempo
    dance_level

    factory :choreographed_dance, aliases: [:choreographed] do
      sequence(:choreographer) { |n| "Choreographer #{n}" }
      sequence(:year) { |n| "177#{n}" }
      sequence(:publication) { |n| "Publication #{n}" }
    end
  end
end
