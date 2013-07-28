FactoryGirl.define do
  factory :valid_user, class: User do
    sequence(:username) {|n| "username#{n}user" }
       sequence(:email) {|n| "email#f.com" }
    password "123"
    password_confirmation { "123" }
  end
  
  
end