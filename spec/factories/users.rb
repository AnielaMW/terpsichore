FactoryGirl.define do
  factory :user, aliases: [:anne] do
    first_name "Anne"
    last_name "Elliot"
    sequence(:user_name) { |n| "Persuaded#{n}" }
    sequence(:email) { |n| "faithful#{n}@bath.uk" }
    sequence(:password) { |n| "fredrick#{n}" }

    factory :admin_user, aliases: [:admin] do
      admin true
    end
  end
end
