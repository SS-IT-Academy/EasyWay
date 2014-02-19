# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :validator do
    name "MyString"
    body "MyString"
    field_type_id 1
    message "Error message"
  end
end
