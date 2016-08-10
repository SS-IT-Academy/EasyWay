# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notify_scheduler do
    period 1
    start_at { 1.day.from_now }
    end_at { 3.days.from_now }
  end
end
