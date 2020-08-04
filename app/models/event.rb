class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendees, through: :attendances, source: :attendee
  has_many :attendances, foreign_key: 'attendee_id', class_name: 'Attendance'
end
