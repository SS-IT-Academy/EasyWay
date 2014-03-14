# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :recurrence do
    repetition '{}'
    duration 1.hour
  end

  factory :invalid_recurrence, parent: :recurrence do
    repetition ""
    duration ""
  end

end
