# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipient do |f|
    f.notify_event_id 1  
    f.user_id 1
    f.group_number 2
  end
end
