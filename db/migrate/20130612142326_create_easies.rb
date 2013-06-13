class CreateEasies < ActiveRecord::Migration
  def change
    create_table :easies do |t|
      t.string :name
      t.string :password

      t.timestamps
    end
  end
end
