# == Schema Information
#
# Table name: sessions
#
#  id           :uuid             not null, primary key
#  live_url     :string
#  scheduled_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  classroom_id :uuid             not null
#  user_id      :uuid
#
# Indexes
#
#  index_sessions_on_classroom_id  (classroom_id)
#  index_sessions_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (classroom_id => classrooms.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
