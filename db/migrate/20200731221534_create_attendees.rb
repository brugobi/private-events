# class CreateAttendees
class CreateAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.integer :attended_event_id, foreign_key: true
      t.integer :attendee_id, foreign_key: true
      t.belongs_to :attendee
      t.belongs_to :attended_event
      t.timestamps
    end
  end
end
