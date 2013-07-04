class AddRecipientsToNotifyEvents < ActiveRecord::Migration
  def change
    add_column :notify_events, :recipients, :string
  end
end
