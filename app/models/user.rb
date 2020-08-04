class User < ApplicationRecord
  has_secure_password
  has_many :events, foreign_key: 'creator_id', class_name: 'Event'
  hhas_many :attends, through: :attendances, source: :attended_event
end
