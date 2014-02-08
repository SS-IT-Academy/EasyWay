class AddColumnToEvent < ActiveRecord::Migration
  def change
    add_column :events, :parent_id, :integer
  end
end
