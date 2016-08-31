Given(/^(?:|I am '([\w\d\.\-]+)'\s*)logged in (?:|user\s)as '([\w\s\.\-]+)'$/) do |username, role| # '[
  user = if username.blank?
    user = create_user_with_role(role, username, email, password)
  else
    User.find_by_username(username)
  end

  steps %{
    When I go to the 'index' page
    When I click on 'Sign in' button-link
    Then I fill in User form with:
    |Email    | admin@test.com |
    |Password | qwerty12345    |
    When I click on 'Sign in' button-submit
    Then I should be logged in as '#{user.username}'
  }  
end

Given(/^user as '([\w\s]+)'\s*(?:|with)\s*(?:|username:\s*'([\w\s\.\-]+)')\s*(?:|email:\s*'([\w\d\@\.\-]+)')\s*(?:|password:\s*'([\w\d\!\@\#\$\%\^\&\*\<\>\?\.\,\;]+)')$/) do |role, username, email, password|
  user = create_user_with_role(role, username, email, password)
  expect(user).to be_persisted
  expect(user.errors).to be_empty
  expect(User.where(username: username, email: email).all).not_to be_blank
end

Then(/^I should be logged in as '([\w\s\.\-]+)'$/) do |username|
  expect(page).to have_css('div p', text: 'Signed in successfull')
  expect(page).to have_css('a', text: "Logged as #{username}")
end

Then(/^I should be logged out$/) do
  expect(page).not_to have_css('a', text: /Logged as/)
  expect(page).to have_css('div p', text: 'Signed out successfully')
end
