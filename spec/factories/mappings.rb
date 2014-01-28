# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mapping do
    notify_observer_property_id 1
    template_parameter "MyString"
    notify_template_id 1
  end
end
