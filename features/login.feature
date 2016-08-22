Feature: Login
  In order to ensure login capabilities
  User should be able to login in the system

  Scenario: Login to 
    When I go to the 'index' page
    Then I should see 'Log in' button
    When I click on 'Log in' button
    Then I should be logged in
