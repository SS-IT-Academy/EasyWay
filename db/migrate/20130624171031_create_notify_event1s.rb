class CreateNotifyEvent1s < ActiveRecord::Migration
  def change
    create_table :notify_event1s do |t|
      t.integer :event_id
      t.string :name
      t.integer :observer_id
      t.integer :template_id

      t.timestamps
    end
  end
end
