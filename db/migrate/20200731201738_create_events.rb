# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event_name
      t.text :description
      t.date :date
      t.references :creator

      t.timestamps
    end
  end
end
