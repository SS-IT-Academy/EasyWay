require 'user/admin_provider'

namespace :ci do
  namespace :setup do
    task :build do
      var = "RAILS_ENV=test"
      system "#{var} rake metrics:all"
      var = "#{var} GENERATE_REPORTS=true"
      Kernel.puts "Tests run is unstable #{$?}." unless system "#{var} rake ci:setup:rspec spec"
    end
  end
end

namespace :app do
  namespace :setup do
    task :create_admin do
      if User.all.any?
        Kernel.puts "There are other users in the system!"
      else
        AdminProvider.add_admin  
      end
    end
  end
end
