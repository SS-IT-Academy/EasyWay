Before('@load-seed-data') do
  load File.join(Rails.root, 'db', 'seeds.rb')
end