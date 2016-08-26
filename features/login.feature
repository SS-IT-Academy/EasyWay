@load-seed-data

Feature: Login
  In order to ensure login capabilities
  User should be able to login in the system

  Scenario: Login to
    Given user as 'Admin' with username: 'Michel' email: 'admin@test.com' password: 'qwerty12345'
    When I go to the 'index' page
    Then I should see 'Sign in' button-link
    When I click on 'Sign in' button-link
    Then I should see 'Email' and 'Password' inputs
    Then I fill in User form with:
      |Email    | admin@test.com |
      |Password | qwerty12345    |
    Then I should see 'Sign in' button-submit
    When I click on 'Sign in' button-submit
    Then I should be logged in as 'Michel'
