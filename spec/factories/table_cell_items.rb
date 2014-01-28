FactoryGirl.define do

  factory :table_cell_item do
  	resource_type_id 1
  	table_template_id 1
  end

  factory :invalid_table_cell_item, parent: :table_cell_item do
    resource_type_id ''
    table_template_id ''
  end

end