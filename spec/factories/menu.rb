FactoryGirl.define do
  factory :menu do
    sequence(:position) {|n| "#{n}" }
    bookmark
  end
end
