RSpec.configure do |config|
  # option 1
  # clean the database in case you had any left overs from previous runs
  # config.before(:suite) do
  #   DatabaseCleaner.clean_with(:deletion)
  # end

  # option 2 - Transactions
  # use roll back transactions after each test case
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
