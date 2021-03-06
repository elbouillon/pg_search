require "bundler/setup"
require "pg_search"

RSpec.configure do |config|
  config.filter_run :focus => true
  config.run_all_when_everything_filtered = true

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.mock_with :rspec do |c|
    c.syntax = :expect
  end
end

require 'support/coveralls'
require 'support/database'
require 'support/with_model'

DOCUMENTS_SCHEMA = lambda do |t|
  t.belongs_to :searchable, :polymorphic => true
  t.text :content
  t.timestamps
end
