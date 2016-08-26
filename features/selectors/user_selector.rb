module Selector
  class UserSelector < BaseSelector
    DATA = {
      form: {
        email: '.new_user input[name*="email"]',
        password: '.new_user input[name*="password"]'
      }
    }
  end
end
