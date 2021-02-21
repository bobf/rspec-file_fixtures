# frozen_string_literal: true

require 'yaml'
require 'json'
require 'pathname'

require 'rspec'

require 'rspec/file_fixtures/version'
require 'rspec/file_fixtures/fixture'

module RSpec
  # Provides a `fixture` method in all RSpec tests.
  module FileFixtures
    class Error < StandardError; end

    def fixture(path)
      Fixture.new(path)
    end
  end
end

RSpec.configure do |config|
  config.include(RSpec::FileFixtures)
end
