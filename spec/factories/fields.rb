FactoryGirl.define do
  factory :field do
    name "new field"
    field_type
    resource_type
    sequence(:resource_type_reference_id) { |n| n }
  end

  factory :field_type do
    name "MyFieldType"
  end
end