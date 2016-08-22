When(/^I go to (?:|the) '([\w\/-]+)' page$/) do |target|
  target = target == 'index' ? '' : target
  path = "/#{target}"
  visit(path)
end
