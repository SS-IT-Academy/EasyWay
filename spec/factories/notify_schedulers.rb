# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notify_scheduler do |f|
    f.period 1
    f.start_at 10.22
    f.end_at 12.22

  end
end
