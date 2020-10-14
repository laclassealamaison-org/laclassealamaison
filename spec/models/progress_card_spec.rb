# == Schema Information
#
# Table name: progress_cards
#
#  id         :uuid             not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  child_id   :uuid             not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_progress_cards_on_child_id  (child_id)
#  index_progress_cards_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (child_id => children.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe ProgressCard, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
