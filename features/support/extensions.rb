require Rails.root.join('features/lib/capybara_bootstrap_datepicker')

module Extensions
  include Capybara::BootstrapDatepicker

  def set_value(path, value)
    if (matched_value = value.match(/date\((\d\d\/\d\d\/\d\d\d\d)\)/))
      value = matched_value[1]
      select_bootstrap_date(find(path), value, format: '%m/%d/%Y')
    elsif (matched_value = value.match(/click(?:_(\w+))?\(([\w\s\d\-\_]+)\)/))
      tag  = matched_value[1]
      text = matched_value[2]
      path = "#{path} #{tag}" if tag
      find(path, text: /#{text}/i, exact: false).click
    else
      find(path).set(value)
    end
  end
end

World(Extensions)
