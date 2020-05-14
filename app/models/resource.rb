# == Schema Information
#
# Table name: resources
#
#  id           :uuid             not null, primary key
#  description  :string
#  name         :string
#  url          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  classroom_id :uuid             not null
#
# Indexes
#
#  index_resources_on_classroom_id  (classroom_id)
#
# Foreign Keys
#
#  fk_rails_...  (classroom_id => classrooms.id)
#
class Resource < ApplicationRecord
  has_many :classroom_resources
<<<<<<< HEAD
  has_many :classrooms, through: :classroom_resources
=======
  has_many :classroom, through: :classroom_resources
>>>>>>> 7bb90d030ddf28878b1f540c8542bf48628cd0a8
end
