# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notify_event1 do
    event_id 1
    name "MyString"
    observer_id 1
    template_id 1
  end
end
