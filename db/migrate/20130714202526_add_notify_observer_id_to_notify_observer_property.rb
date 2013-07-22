class AddNotifyObserverIdToNotifyObserverProperty < ActiveRecord::Migration
  def change
    add_column :notify_observer_properties, :notify_observer_id, :integer
    add_index :notify_observer_properties, :notify_observer_id
  end
end
