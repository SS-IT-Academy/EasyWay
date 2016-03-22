class CreateEventsSecond < ActiveRecord::Migration
  def change
    drop_table :events
    create_table :events do |t|
      t.string :name
      t.references :event_types, index: true
      t.timestamp :start_at
      t.timestamp :end_at
      t.integer :recurrence_id

      t.timestamps
    end
  end
end