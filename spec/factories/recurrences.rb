# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :recurrence do
    repetition "2"
    duration "1800"
  end

  factory :invalid_recurrence, parent: :recurrence do
    repetition ""
    duration ""
  end

end
