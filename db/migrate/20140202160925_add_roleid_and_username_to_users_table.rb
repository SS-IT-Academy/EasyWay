class AddRoleidAndUsernameToUsersTable < ActiveRecord::Migration
  def change
  	add_column :users, :roleid, :integer
  	add_column :users, :username, :string
  end
end
