Then(/^I should see '([\w\s]+)' button(?:|-)(\w+)?$/) do |target, tag|
  if tag
    expect(page).to have_css(tag, text: /#{target}/i, exact: false)
  else
    expect(page).to have_button(target)
  end
end

Then(/^I should see (\w+) table empty$/) do |type|
  css_class = "table.#{type.downcase}-list-table"
  page.should have_selector("#{css_class} tr", count: 1)
end

Then(/^I should see text '([\w '\.\(\)]+)'$/) do |text|
  page.should have_content text
end

Then(/^I should see confirmation modal window$/) do
  page.should have_selector('div.uui-modal', visible: true)
end

Then(/^I should see popup window$/) do
  page.should have_selector('div.popup', visible: true)
end

Then(/^'Saved' icon should be shown$/) do
  js_condition = "$('.saved-wrapper').is(':visible')"
  wait_for_js_condition(js_condition, true)
  page.evaluate_script(js_condition).should be_truthy
  wait_for_js_condition(js_condition, false)
  page.evaluate_script(js_condition).should_not be_truthy
end

Then(/^I should see (\w+) table(?:|-)(\w+)? with '([\w\.\d\s\_\-]+)' '([\s\w\d\_\-]+)'$/) do |type, tag, field, value|
  wait_for_ajax
  if tag
    css_class = "table #{tag}.#{type.downcase}-list-table"
    css_class = "table #{tag}.#{type.downcase}-table" unless first(css_class)
  else
    css_class = "table.#{type.downcase}-list-table"
    css_class = "table.#{type.downcase}-table" unless first(css_class)
  end
  page.should have_selector("#{css_class} tr", minimum: tag ? 1 : 2)
  selector = Selector::BaseSelector.get_selector_instance(type)
  path = selector.get(:table, field)
  page.should have_selector("#{css_class} tr #{path}", text: /#{value}/i)
end

Then(/^I should be logged in or should be redirected to '([\d\w\:\/\-\_\+\.]+)' with '([\w\d\/\:\=\-\_\+\.\&\?]+)' parameter$/) do |url, sub_url|
  if /#{url}/.match(current_url)
    expect(current_url).to match(/#{sub_url}/)
  else
    expect(page).to have_selector('div.profile-photo')
    expect(page).to_not have_button('EPAM Login')
  end
end

Then(/^I should see '([\w\s\+]+)' action icon$/) do |target|
  expect(page).to have_css('i.fa-pencil', visible: true) if 'Edit' == target
end
