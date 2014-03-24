class AddDurationColumnToRecurrence < ActiveRecord::Migration
  def change
    add_column :recurrences, :hour_duration, :integer
    add_column :recurrences, :minute_duration, :integer
  end
end
