
FactoryGirl.define do
  factory :role do
    sequence(:name) {|n| "name#{n}role" }
  end
end



