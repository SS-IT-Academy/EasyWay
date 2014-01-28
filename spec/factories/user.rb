FactoryGirl.define do
  factory :user, class: User do
    sequence(:username) {|n| "username#{n}user" }
    sequence(:email)    {|n| "email#{n}@.com" }
    password "123"
    password_confirmation "123"
    
  end

  factory :invalid_user, parent: :user do
    username ""
    email ""
    password "123"
    password_confirmation "123"
    
  end
  
  
end