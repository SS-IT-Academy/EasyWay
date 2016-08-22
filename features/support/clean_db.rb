DatabaseCleaner.strategy = DatabaseCleaner::NullStrategy

After do
  Event.destroy_all
  ActiveRecord::Base.transaction do
  end
end
