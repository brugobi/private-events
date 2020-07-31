class Attendee < ApplicationRecord
  has_many :events, foreign_key: :event_id
  has_many :users, through: :events, source: :event
end
