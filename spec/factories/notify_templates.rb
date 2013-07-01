# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notify_template do
    template_name "MyString"
    body "MyString"
    desc "MyString"
  end
end
