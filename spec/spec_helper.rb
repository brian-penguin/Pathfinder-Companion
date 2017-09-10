require 'capybara/rspec'

RSpec.configure do |config|
  config.before(:all) do
    @class_requirements_template = {
      alchemist: nil,
      antipaladin: nil,
      bard: nil,
      bloodrager: nil,
      cleric: nil,
      druid: nil,
      hunter: nil,
      inquisitor: nil,
      investigator: nil,
      magus: nil,
      medium: nil,
      mesmerist: nil,
      occultist: nil,
      oracle: nil,
      paladin: nil,
      psychic: nil,
      ranger: nil,
      shaman: nil,
      skald: nil,
      sorcerer: nil,
      spiritualist: nil,
      summoner: nil,
      witch: nil,
      wizard: nil
    }
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.filter_run_when_matching :focus

  config.disable_monkey_patching!

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.after(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
end
