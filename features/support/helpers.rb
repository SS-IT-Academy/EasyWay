module Helpers
  def create_user_with_role(role = 'Guest', username = 'Some', email = 'some@example.com', pass = '12345678')
    user = User.new(username: username, email: email, password: pass, password_confirmation: pass)
    user.role = Role.find_by_name(role)
    user.skip_confirmation!
    user.save
    user
  end
end

World(Helpers)