Then(/^I should see '([\w\s]+)' button(?:|-)(\w+)?$/) do |target, tag|
  if tag.blank?
    expect(page).to have_button(target)
  elsif tag == 'link'
    expect(page).to have_css('a', text: /#{target}/i, exact: false)
  elsif tag == 'submit'
    expect(page).to have_css("input[type='submit'][value*=\"#{target}\"]", exact: false)
  else
    expect(page).to have_css(tag, text: /#{target}/i, exact: false)
  end
end

Then(/^I should see (\w+) table empty$/) do |type|
  css_class = "table.#{type.downcase}-list-table"
  expect(page).to have_css("#{css_class} tr", count: 1)
end

Then(/^I should see (.+) inputs$/) do |names|
  names.split('and').each do |label|
    name = label.strip.gsub(/\'/, "")
    expect(page).to have_css("label", text: name)
    expect(page).to have_css("label ~ input[name*=\"#{name.downcase}\"]")
  end  
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
