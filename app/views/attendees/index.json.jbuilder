# frozen_string_literal: true

json.array! @attendees, partial: 'attendees/attendee', as: :attendee
