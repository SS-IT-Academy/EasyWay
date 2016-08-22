class AdminProvider
  USERNAME = 'Admin'

  def self.get_data
    STDOUT.puts "Enter email:\n"
    email = STDIN.gets
    while true do
      STDOUT.puts "Enter password:\n"
      pass = STDIN.gets
      STDOUT.puts "Enter password confirmation:\n"
      pass_conf = STDIN.gets
      break if pass == pass_conf
      STDOUT.puts "Password confirmation doesn't equal password!"        
    end
    [USERNAME, pass.strip, pass_conf.strip, email.strip]
  end

  def self.add_admin
    username, pass, pass_conf, email = get_data
    user = User.new(
      password: pass.strip,
      password_confirmation: pass_conf.strip,
      username: username.strip, 
      email: email)
    user.role = Role.find(1)
    user.skip_confirmation!
    user.save!
    Kernel.puts "Admin was successfully created!"
  end
end  