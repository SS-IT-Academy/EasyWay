class AddColumnToRecurrences < ActiveRecord::Migration
  def change
    add_column :recurrences, :repetition, :string
  end
end
