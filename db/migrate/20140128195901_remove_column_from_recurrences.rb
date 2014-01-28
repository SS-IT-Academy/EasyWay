class RemoveColumnFromRecurrences < ActiveRecord::Migration
  def up
    remove_column :recurrences, :days_of_month
    remove_column :recurrences, :days_of_week
    remove_column :recurrences, :days_of_year
  end

  def down
    add_column :recurrences, :days_of_year, :string
    add_column :recurrences, :days_of_week, :string
    add_column :recurrences, :days_of_month, :string
  end
end
