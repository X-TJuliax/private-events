class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.bigint :attendee_id, null: false
      t.bigint :attended_event_id, null: false

      t.timestamps
    end
    add_foreign_key :attendances, :users, column: :attendee_id
    add_foreign_key :attendances, :events, column: :attended_event_id
    add_index :attendances, [:attendee_id, :attended_event_id], unique: true

  end
end
