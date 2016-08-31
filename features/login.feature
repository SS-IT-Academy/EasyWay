@load-seed-data

Feature: Login
  In order to ensure login capabilities
  User should be able to login and logout

  Scenario: Login to system
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

  Scenario: Logout from system
    Given user as 'Admin' with username: 'Michel' email: 'admin@test.com' password: 'qwerty12345'
    And I am 'Michel' logged in as 'Admin' 
    When I go to the 'index' page
    Then I should see the page
    Then I should see 'Sign Out' button-link
    When I click on 'Sign Out' button-link

    Then I should be logged out
