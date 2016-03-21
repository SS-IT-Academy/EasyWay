class CreateNotifyTemplates < ActiveRecord::Migration
  def change
    create_table :notify_templates do |t|
      t.string :notify_template_name
      t.text :body
      t.text :desc

      t.timestamps
    end
  end
end
