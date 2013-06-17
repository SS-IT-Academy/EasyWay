class CreateNotifySchedulers < ActiveRecord::Migration
  def change
    create_table :notify_schedulers do |t|
      t.integer :period
      t.time :start_at
      t.time :start_end

      t.timestamps
    end
  end
end
