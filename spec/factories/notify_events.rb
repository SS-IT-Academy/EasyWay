# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notify_event do |f|
    f.name "MyString"   
    f.notify_template_id 1
    f.event_id 1
    f.notify_observer_id 2
    #f.recipients "first"
  end
end
