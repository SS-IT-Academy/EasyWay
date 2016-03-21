class CreateNotifySchedulers < ActiveRecord::Migration
  def change
    create_table :notify_schedulers do |t|
      t.integer :period
      t.time :start_at
      t.time :end_at
      
      t.timestamps
    end
  end
end
