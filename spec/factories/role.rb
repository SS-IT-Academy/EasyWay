
FactoryGirl.define do
  factory :role do
    sequence(:name) {|n| "name#{n}role" }
  end

  factory :invalid_role, parent: :role do
    name ""
  end
end



