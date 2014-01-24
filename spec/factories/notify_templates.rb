# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notify_template do |f|
    f.notify_template_name "UserObserver"
    f.body "MyString"
    f.desc "MyString"
  end
end
