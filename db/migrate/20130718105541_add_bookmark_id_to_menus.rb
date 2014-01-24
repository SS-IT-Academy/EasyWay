class AddBookmarkIdToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :bookmark_id, :integer
  end
end
