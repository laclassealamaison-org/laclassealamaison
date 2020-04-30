FactoryBot.define do
  factory :child do
    name { FFaker::Name.first_name }
    parent { create :user, role: :responsible_parent }
    classroom
  end
end
