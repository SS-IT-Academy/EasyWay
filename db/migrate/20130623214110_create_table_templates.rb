class CreateTableTemplates < ActiveRecord::Migration
  def change
    create_table :table_templates do |t|
      t.string :name
      t.text :cell_body

      t.timestamps
    end
  end
end
