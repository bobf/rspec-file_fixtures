# frozen_string_literal: true

require 'yaml'
require 'json'
require 'pathname'
require 'rspec'

require 'rspec_file_fixtures/version'
require 'rspec_file_fixtures/fixture'

# Provides a `fixture` method in all RSpec tests.
module RSpecFileFixtures
  class Error < StandardError; end

  def fixture(path)
    Fixture.new(path)
  end
end

RSpec.configure do |config|
  config.include(RSpecFileFixtures)
end
