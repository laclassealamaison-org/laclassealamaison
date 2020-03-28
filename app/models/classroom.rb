class Classroom < ApplicationRecord
    has_many :sessions
    has_many :resources
end
