When(/^I click (?:|on) '([\w\s]+)' button(?:|-)(\w+)?$/) do |target, tag|
  button = if tag.blank?
    find_button(target)
  elsif tag == 'link'
    find('a', text: /#{target}/i, exact: false)
  elsif tag == 'submit'
    find("input[type='submit'][value*=\"#{target}\"]", exact: false)
  else
    find(tag, text: /#{target}/i, exact: false)
  end
  # if button['data-method']
  #   Kernel.puts "button['data-method']: #{button['data-method']}, href: #{button['href']}"
  #   page.driver.browser.submit "#{button['data-method']}", button['href'], {}#("projects/" + proj.id.to_s + "/log?upload_path=" + f.to_path)
  # else  
    button.trigger('click')
  # end  
  wait_for_ajax
end

When(/^I click (?:|on) '([\w\s\+]+)' action icon$/) do |target|
  if 'Edit' == target
    icon = find('i.fa-pencil', visible: true).find(:xpath, '..')
  end
  icon.click
  wait_for_ajax
end

When(/^I click (?:|on) modal window '([\w\s]+)' button(?:|-)(\w+)?$/) do |target, tag|
  popup = find('div.uui-modal')
  if tag
    button = popup.find(tag, text: /#{target}/i, exact: false, visible: true)
  else
    button = popup.find_button(target, visible: true)
  end
  button.click
  wait_for_ajax
end

When(/^I click (?:|on) popup '([\w\s]+)' button(?:|-)(\w+)?$/) do |target, tag|
  popup = find('div.popup')
  if tag
    button = popup.find(tag, text: /#{target}/i, exact: false, visible: true)
  else
    button = popup.find_button(target, visible: true)
  end
  button.click
  wait_for_ajax
end

When(/^I click (?:|on) '([\w\s\(\)]+)' link(?:|-)(\w+)?$/) do |target, tag|
  link = tag ? find(tag, text: /^#{target}$/i, exact: false) : find_link(target)
  link.click
end

When(/^I click (?:|on) first '([\w\s\(\)]+)' link(?:|-)(\w+)?$/) do |target, tag|
  link = tag ? first(tag, text: /^#{target}$/i, exact: false) : first('a', text: /^#{target}$/i, exact: false)
  link.click
end

When(/^I click (?:|on) '([\w\s]+)' tab of '([\w\s\*]+)' switch$/) do |tab_text, switch_text|
  switch = find(:xpath, "//p[contains(text(),'#{switch_text}')]/following-sibling::ul")
  tab = switch.find('label', text: /#{tab_text}/i)
  tab.click
  wait_for_ajax
end

When(/^I hover (\w+) table(?:|-)(\w+)? row with '([\s\w\d\_\-]+)' text$/) do |type, tag, value|
  if tag
    css_class = "table #{tag}.#{type.downcase}-list-table"
  else
    css_class = "table.#{type.downcase}-list-table"
  end
  find("#{css_class} tr", text: /#{value}/i).hover
end

When(/^I press 'Enter' button$/) do
  find('body').native.send_keys(:enter)
  wait_for_ajax
end

Then(/^I fill in (\w+) form (?:'([\w\s\d]+)' )?with:/) do |type, form, inputs|
  selector = Selector::BaseSelector.get_selector_instance(type)
  inputs.transpose.hashes.each do |hash|
    hash.each do |key, value|
      value = "date(#{Chronic.parse(value).strftime('%m/%d/%Y')})" if key =~ /date/i
      path = selector.get(:form, key)
      path = "#{form} #{path}" if form
      if (/select/i).match(key)
        find("#{path} button.selectpicker").click
        find("#{path} span", text: value).click
      else
        set_value(path, value)
      end
    end
  end
end
