# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notify_observer_property do
    name "MyString"
    notify_observer_id 1
  end
end
