# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :recurrence do
    repetition "2"
    start_date DateTime.now.utc
    end_date DateTime.now.utc + 1.day
  end

  factory :invalid_recurrence, parent: :recurrence do
    repetition ""
    start_date ""
    end_date ""
  end

end
