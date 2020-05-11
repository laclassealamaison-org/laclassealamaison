FactoryBot.define do
  factory :course do
    title { FFaker::Lorem.sentence }
    description { FFaker::Lorem.sentence }
    content { FFaker::Lorem.sentence }
    user
    classroom
    trait :unpublished do
      after(:create) { |course|
        course.update!(published: false)
      }
    end

  end
end
