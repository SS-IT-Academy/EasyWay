class AddMessageToValidators < ActiveRecord::Migration
  def change
    add_column :validators, :message, :string
  end
end
