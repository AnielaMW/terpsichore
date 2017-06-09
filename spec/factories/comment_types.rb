FactoryGirl.define do
  factory :comment_type do
    sequence(:name) { |n| "Comment #{n}" }
    description "Comment Description"

    factory :variation, class: CommentType do
      sequence(:name) { |n| "Variation #{n}" }
    end

    factory :style_point, class: CommentType do
      sequence(:name) { |n| "Style Point #{n}" }
    end
  end
end
