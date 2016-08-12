FactoryGirl.define do
  factory :resource_type do
    sequence(:name) { |n| "new resource type##{n}" } 
  end

  factory :resource do
    description "new resource"
    resource_type
  end


  factory :resource_value do
    field
    resource
    value "new resource value"
    #sequence(:resource_reference_id) { |n| n }
  end
end
