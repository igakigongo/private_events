# frozen_string_literal: true

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = 'spec/examples.txt'
  config.disable_monkey_patching!
  config.default_formatter = 'doc' if config.files_to_run.one?
  # this uses either random or defined, passed as symbols
  # you can alse define this at the spec level
  # what I have put here is global
  config.order = :random
  Kernel.srand config.seed
end

# sign in users and check that path is okay
def sign_in_and_test_path_for(user)
  visit signin_path
  fill_in 'name', with: user.name
  click_on('Authenticate')
  path = "/users/#{user.id}"
  expect(page).to have_current_path(path)
end
