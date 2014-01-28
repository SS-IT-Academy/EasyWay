class CreateNotifyObserverProperties < ActiveRecord::Migration
  def change
    create_table :notify_observer_properties do |t|
      t.string :name
      t.integer :notify_observer_id
      t.timestamps
    end
  end
end
