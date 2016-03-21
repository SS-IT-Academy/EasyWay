class AddPositionToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :position, :integer
  end
end
