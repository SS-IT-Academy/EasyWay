# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notify_scheduler do |f|
    f.period 1
    f.start_at  Time.new(1993, 02, 24, 10, 22, 0, "+02:00")
    f.end_at  Time.new(1993, 02, 24, 12, 22, 0, "+02:00")
  end
end
