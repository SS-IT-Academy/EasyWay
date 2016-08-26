#DatabaseCleaner.strategy = DatabaseCleaner::NullStrategy
DatabaseCleaner.strategy = :truncation

After do
  ActiveRecord::Base.transaction do
    DatabaseCleaner.clean
  end
end
