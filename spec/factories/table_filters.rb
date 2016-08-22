FactoryGirl.define do
  factory :table_filter do
    delimiter 1
    position_float 1
    position_num 1
    resource
    table_template
  end

  factory :invalid_table_filter, parent: :table_filter do
    delimiter ''
    position_float ''
    position_num ''
    resource_id ''
    table_template_id ''
  end
end