FactoryBot.define do
  factory :resource do
    name { FFaker::Lorem.sentence }
    description { FFaker::Lorem.sentence }
    url { FFaker::Youtube.url}
    classroom
  end
end
