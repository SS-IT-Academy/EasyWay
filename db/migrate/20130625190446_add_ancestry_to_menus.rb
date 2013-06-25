class AddAncestryToMenus < ActiveRecord::Migration
  def self.up
    add_column :menus, :ancestry, :string
    add_index :menus, :ancestry  
  end
  def self.down
   remove_index :menus, :ancestry  
   remove_column :menus, :ancestry
  end
end
