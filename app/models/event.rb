class Event < ApplicationRecord
  validates :event_name, presence: true, uniqueness: true
  validates :description, presence: true
  belongs_to :creator, class_name: 'User'
  has_many :attendances, foreign_key: 'attended_event_id', class_name: 'Attendance', dependent: :destroy
  has_many :attendees, through: :attendances, source: :attendee, class_name: 'User'

  scope :upcoming_events, -> { where('date >= ?', Date.today).order(date: :desc) }
  scope :previous_events, -> { where('date < ?', Date.today).order(date: :desc) }
end
