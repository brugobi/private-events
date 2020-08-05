class User < ApplicationRecord
  has_secure_password
  has_many :events, foreign_key: 'creator_id', class_name: 'Event'
  has_many :attendances, foreign_key: 'attendee_id'
  has_many :attended_events, through: :attendances, source: :attendee, class_name: 'Event', dependent: :destroy
end
