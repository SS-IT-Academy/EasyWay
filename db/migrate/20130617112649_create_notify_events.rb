class CreateNotifyEvents < ActiveRecord::Migration
  def change
    create_table :notify_events do |t|
      t.integer :template_id
      t.integer :event_id
      t.string :name
      t.integer :observer_id

      t.timestamps
    end
  end
end
