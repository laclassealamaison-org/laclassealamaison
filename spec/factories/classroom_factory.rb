# == Schema Information
#
# Table name: classrooms
#
#  id         :uuid             not null, primary key
#  color      :string
#  name       :string
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :classroom do
    name { FFaker::Lorem.word }
  end
end
