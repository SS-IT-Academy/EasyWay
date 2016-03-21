class CreateRecurrences < ActiveRecord::Migration
  def change
    create_table :recurrences do |t|
      t.string :days_of_week
      t.string :days_of_month
      t.string :days_of_year
      t.timestamp :start_date
      t.timestamp :end_date

      t.timestamps
    end
  end
end
