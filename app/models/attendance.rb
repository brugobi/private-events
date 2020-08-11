# class to create a new table attendances
class Attendance < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'
end
