def wait_for_ajax
  return if page.evaluate_script('typeof $ === "undefined"')
  Timeout.timeout(Capybara.default_max_wait_time) do
    loop until page.evaluate_script('$.active').zero?
  end
end
