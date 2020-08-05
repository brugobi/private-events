class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: 'attended_event_id', class_name: 'Attendance', dependent: :destroy
  has_many :attendees, through: :attendances, source: :attendee, class_name: 'User'
end
