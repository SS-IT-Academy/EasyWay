FactoryGirl.define do

  factory :permission do
    name 2
  end

  factory :invalid_permission, parent: :permission do
  	name nil
  end

end