class CreateTableTemplates < ActiveRecord::Migration
  def change
    create_table :table_templates do |t|
      t.text :cell_body
      t.string :name

      t.timestamps
    end
  end
end
