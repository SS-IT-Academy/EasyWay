class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :parent_id
      t.integer :role_id
      t.string :url
      t.integer :user_id
      t.string :text
      t.string :title
      t.string :target

      t.timestamps
    end
  end
end
