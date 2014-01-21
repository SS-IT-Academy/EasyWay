FactoryGirl.define do

  factory :event_resource do
    resource_id 1
    event_id 1
  end

  factory :invalid_event_resource, parent: :event_resource do
    resource_id ''
    event_id ''
  end

end