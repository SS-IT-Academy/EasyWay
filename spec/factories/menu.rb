FactoryGirl.define do
  factory :menu do
    sequence(:position) {|n| "#{n}" }
  end
end
