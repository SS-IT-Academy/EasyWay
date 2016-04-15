require 'yaml'
FactoryGirl.define do

	factory :recurrence do
		repetition YAML.load(<<-REPETITION
---
:validations:
:day_of_month:
- 27
:rule_type: IceCube::MonthlyRule
:interval: 1
REPETITION
	)
	end

  factory :recurrence_with_repetition do
    repetition YAML.load(<<-REPETITION
---
:validations:
:day_of_month:
- 27
- 28
:rule_type: IceCube::MonthlyRule
:interval: 1
REPETITION
  )
  end

	factory :invalid_recurrence, parent: :recurrence do
		repetition ""
	end

end