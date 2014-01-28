# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bookmark do
    url "MyString"
    title "MyString"
  end

  factory :invalid_bookmark, parent: :bookmark do
    url ''
    title ''
  end
end
