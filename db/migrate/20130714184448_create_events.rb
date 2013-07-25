class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.integer :event_type_id
      t.timestamp :start_at
      t.timestamp :end_at
      t.integer :recurrence_id

      t.timestamps
    end
  end
end
