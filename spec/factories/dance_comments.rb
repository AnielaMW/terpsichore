FactoryBot.define do
  factory :dance_comment do
    sequence(:comment) { |n| "Message #{n}" }
    dance
    user
    comment_type

    factory :dcom_comment do
      comment_type
    end

    factory :dvar_comment do
      association :comment_type, factory: :variation
    end

    factory :dstyle_comment do
      association :comment_type, factory: :style_point
    end
  end
end
