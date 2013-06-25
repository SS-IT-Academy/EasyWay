FactoryGirl.define do
  factory :menu do
    sequence(:title) {|n| "title#{n}menu" }
    sequence(:target) {|n| "target#{n}menu" }
    sequence(:url) {|n| "url#{n}menu" }
    sequence(:text) {|n| "text#{n}menu" }
  end
end
