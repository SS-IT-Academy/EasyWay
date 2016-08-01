namespace :ci do
  namespace :setup do
    task :build do
      var = "RAILS_ENV=test"
      Kernel.puts `#{var} rake db:migrate`
#      system "#{var} rake metrics:all"
      var = "#{var} GENERATE_REPORTS=true"
      Kernel.puts "Tests run is unstable #{$?}." unless system "#{var} rake ci:setup:rspec spec"
    end
  end
end
