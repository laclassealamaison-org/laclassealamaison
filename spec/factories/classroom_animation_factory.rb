FactoryBot.define do
  factory :classroom_animation do
    starts_at { DateTime.now + 2.hour }
    live_url { FFaker::Internet.uri(:https) }

    classroom
    course
    user

    trait :current do
      starts_at { DateTime.now - 1.second }
    end

    trait :past do
      starts_at { DateTime.now - 2.hour }
    end

    trait :future do
      starts_at { DateTime.now + 2.hour }
    end
  end
end
