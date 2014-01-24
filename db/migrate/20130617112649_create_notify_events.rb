class CreateNotifyEvents < ActiveRecord::Migration
  def change
    create_table :notify_events do |t|
      t.string :name
      t.integer :notify_template_id
      t.integer :event_id
      t.integer :notify_observer_id
      t.string :recipients

      t.timestamps
    end
  end
end
