class CreateTemplateMappings < ActiveRecord::Migration
  def change
    create_table :template_mappings do |t|
      t.string :notifytemplatepropertyname
      t.string :mappedelement

      t.timestamps
    end
  end
end
