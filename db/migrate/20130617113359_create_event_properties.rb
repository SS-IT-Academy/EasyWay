class CreateEventProperties < ActiveRecord::Migration
  def change
    create_table :event_properties do |t|
      t.string :name

      t.timestamps
    end
  end
end
