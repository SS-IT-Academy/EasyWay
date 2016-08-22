def wait_for_js_condition(condition, value)
  Timeout.timeout(10) do
    loop until page.evaluate_script(condition) == value
  end
end
