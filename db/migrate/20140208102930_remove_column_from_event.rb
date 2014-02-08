class RemoveColumnFromEvent < ActiveRecord::Migration
  def up
    remove_column :events, :end_at
  end

  def down
    add_column :events, :end_at, :timestamp
  end
end
