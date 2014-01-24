FactoryGirl.define do
  factory :resource_type do
    sequence(:name) { |n| "new resource type##{n}" } 
  end

  factory :field_type do
    name "new field type"
  end

  factory :resource do
    description "new resource"
    resource_type
  end

  factory :field do
    name "new field"
    field_type
    resource_type
    sequence(:resource_type_reference_id) { |n| n }
  end

  factory :resource_value do
    field
    resource
    value "new resource value"
    sequence(:resource_reference_id) { |n| n }
  end
end
