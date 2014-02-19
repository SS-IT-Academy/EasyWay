class AddColumnDurationToEvent < ActiveRecord::Migration
  def change
    add_column :events, :duration, :timestamp
  end
end
