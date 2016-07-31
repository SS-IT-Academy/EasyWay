FactoryGirl.define do
  factory :user, class: User do
    sequence(:username) {|n| "username#{n}user" }
    sequence(:email)    {|n| "email#{n}@mail.com" }
    password "123456789"
    password_confirmation "123456789"

    factory :invited_user, class: User do
      invitation_token 'jdsfjahskfhalsjdfashgurg'
      invitation_created_at 1.day.ago
      invitation_sent_at 1.day.ago
      invitation_accepted_at 1.hour.ago
      invitation_limit 3
      invitations_count 1
    end
  end


  factory :invalid_user, parent: :user do
    username ""
    email ""
    password "123"
    password_confirmation "123"
  end
end