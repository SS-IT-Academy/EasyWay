Given(/^there are no '(\w+)' instances$/) do |class_name|
  model = class_name.singularize.constantize
  model.destroy_all
  expect(model.count).to eq 0
end

Then(/^I should wait for (\d+) second\(s\)$/) do |number|
  sleep number.to_i
end
