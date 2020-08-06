# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_731_221_534) do
  create_table 'attendances', force: :cascade do |t|
    t.integer 'attended_event_id'
    t.integer 'attendee_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['attended_event_id'], name: 'index_attendances_on_attended_event_id'
    t.index ['attendee_id'], name: 'index_attendances_on_attendee_id'
  end
  create_table 'events', force: :cascade do |t|
    t.string 'event_name'
    t.text 'description'
    t.date 'date'
    t.integer 'creator_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['creator_id'], name: 'index_events_on_creator_id'
  end
  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'username'
    t.string 'email'
    t.string 'password'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'password_digest'
  end
end
