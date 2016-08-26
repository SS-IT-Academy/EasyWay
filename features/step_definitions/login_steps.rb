Given(/^logged in user as '([\w\s\.\-]+)'$/) do |role|
  visit("/")
end

Then(/^I should be logged in as '([\w\s\.\-]+)'$/) do |username|
  expect(page).to have_css('div p', text: 'Signed in successfull')
  expect(page).to have_css('a', text: "Logged as #{username}")
end  

Given(/^user as '([\w\s]+)'\s*(?:|with)\s*(?:|username:\s*'([\w\s\.\-]+)')\s*(?:|email:\s*'([\w\d\@\.\-]+)')\s*(?:|password:\s*'([\w\d\!\@\#\$\%\^\&\*\<\>\?\.\,\;]+)')$/) do |role, username, email, password|
  role ||= 'Guest'
  username ||= 'Some'
  email ||= 'some@example.com'
  password ||= '12345678'
  user = User.new(username: username, email: email, password: password, password_confirmation: password)
  user.role = Role.find_by_name(role)
  user.skip_confirmation!
  result = user.save
  expect(result).to be true
  expect(User.where(username: username, email: email).all).not_to be_blank
end
