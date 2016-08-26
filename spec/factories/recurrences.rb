require 'yaml'
FactoryGirl.define do
	factory :recurrence do
    hour_duration 2
    minute_duration 30
		repetition YAML.load(<<-REPETITION
---
:validations:
:day_of_month:
- 27
:rule_type: IceCube::MonthlyRule
:interval: 1
REPETITION
	  )

    factory :recurrence_with_2_repetitions do
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

    factory :recurrence_with_repetitions do
      transient do
        count 2
      end

      before(:create) do |recurrence, evaluator|
        recurrence.repetition = YAML.load(<<-REPETITION
---
:validations:
:day_of_month:
#{evaluator.count.times.map{|ind| "- #{1 + ind}"}.join("\n")}
:rule_type: IceCube::MonthlyRule
:interval: 1
REPETITION
        )

      end
    end

  	factory :invalid_recurrence, parent: :recurrence do
  		repetition ""
  	end
  end  
end