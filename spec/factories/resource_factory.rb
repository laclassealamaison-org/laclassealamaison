FactoryBot.define do
  factory :resource do
    name { FFaker::Lorem.sentence }
    description { FFaker::Lorem.sentence }
    url { FFaker::Youtube.url}
<<<<<<< HEAD
=======
    classroom
>>>>>>> 7bb90d030ddf28878b1f540c8542bf48628cd0a8
  end
end
