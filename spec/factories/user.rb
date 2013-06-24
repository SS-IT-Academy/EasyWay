FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "username#{n}user" }
    sequence(:email) {|n| "email#{n}@f.com" }
    password "123"
    password_confirmation { "123" }
  end
end