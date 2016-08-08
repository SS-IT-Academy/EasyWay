# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notify_event do
    name "MyString"   
    notify_template
    event
    notify_observer

    transient do
      recipients_count 3
    end

    after(:create) do |notify_event, evaluator|
      notify_event.recipients = create_list(:recipient, evaluator.recipients_count, notify_event: notify_event)
    end
  end
end
