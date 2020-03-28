class Session < ApplicationRecord
  belongs_to :classroom, optional: true
  belongs_to :user, optional: true
end
