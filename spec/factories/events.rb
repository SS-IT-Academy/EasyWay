# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do

    name "MyString"
    name ""
    event_type_id ""
    start_at ""
    end_at ""
    recurrence_id 1

  end
end
