# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :recurrence do
    days_of_week "2"
    days_of_month "8"
    days_of_year "80"
    start_date DateTime.now.utc
    end_date DateTime.now.utc + 1.day
  end

  factory :invalid_recurrence, parent: :recurrence do
    days_of_week ""
    days_of_month ""
    days_of_year ""
    start_date ""
    end_date ""
  end

end
