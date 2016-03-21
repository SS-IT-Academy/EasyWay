# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :event_type do
    name "MyString"
  end

  factory :invalid_event_type, parent: :event_type do
    name ""
  end

end
