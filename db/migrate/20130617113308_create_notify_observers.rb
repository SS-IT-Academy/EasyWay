class CreateNotifyObservers < ActiveRecord::Migration
  def change
    create_table :notify_observers do |t|
      t.string :name

      t.timestamps
    end
  end
end
