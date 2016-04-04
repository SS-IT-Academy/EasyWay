class AlterNotifySchedulers < ActiveRecord::Migration
  def change
  	rename_column :notify_schedulers, :start_end, :end_at
  end
end
