class RemoveColumnFromRecurrence < ActiveRecord::Migration
  def up
    remove_column :recurrences, :start_date
    remove_column :recurrences, :end_date
  end

  def down
    add_column :recurrences, :end_date, :datetime
    add_column :recurrences, :start_date, :datetime
  end
end
