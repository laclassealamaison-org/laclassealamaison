FactoryBot.define do
  factory :course do
    title { FFaker::Lorem.sentence }
    description { FFaker::Lorem.sentence }
    content { FFaker::Lorem.sentence }
    user
    classroom
  end
end
