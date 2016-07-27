class RenameEventTypeColumn < ActiveRecord::Migration
  def change
    if column_exists?(:events, :event_types_id)
      rename_column(:events, :event_types_id, :event_type_id)
    else
      add_column :events, :event_type_id, :integer, null: false
    end  
    if index_exists? :events, :event_types_id  
      rename_index :events, :index_people_on_event_types_id, :index_people_on_event_type_id
    else
      add_index :events, :event_type_id  
    end       
  end
end
