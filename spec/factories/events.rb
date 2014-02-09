FactoryGirl.define do

  factory :event do
    name "Event"
    event_type_id 1
    start_at Time.now - 1.day
    duration Time.now + 1.day
    recurrence_id 1

    factory :event_with_type do
      association :event_type, factory: :event_type, name: "Some Name"
    end

  end

  factory :invalid_event, parent: :event do
    name ""
    event_type_id ""
    start_at ""
    duration ""
    recurrence_id 1
  end

end
#test