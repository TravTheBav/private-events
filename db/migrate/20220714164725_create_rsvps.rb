class CreateRsvps < ActiveRecord::Migration[7.0]
  def change
    create_table :rsvps do |t|
      t.references :attendee, null: false, foreign_key: true
      t.references :attended_event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
