# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :table_header do
    resource_type_id 1
    table_template_id 1
    orientation "MyString"
    position_num 1
    parent_id 1
  end
end
