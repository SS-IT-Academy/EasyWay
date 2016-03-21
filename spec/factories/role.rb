
FactoryGirl.define do
  factory :role do
    sequence(:name) {|n| "name#{n}role" }
  end

  factory :invalid_role, parent: :role do
    name nil
  end
end



