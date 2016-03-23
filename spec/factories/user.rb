FactoryGirl.define do
  factory :user, class: User do
    sequence(:username) {|n| "username#{n}user" }
    sequence(:email)    {|n| "email#{n}@mail.com" }
    password "123456789"
    password_confirmation "123456789"
    role_id 5 
  end

  factory :invalid_user, parent: :user do
    username ""
    email ""
    password "123"
    password_confirmation "123"
    
  end
  
  
end