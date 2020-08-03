class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  #has_many :users, through: attendees, source: :user_id
end
