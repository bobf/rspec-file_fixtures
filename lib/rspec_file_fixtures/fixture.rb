# frozen_string_literal: true

module RSpecFileFixtures
  # Provides access to the contents and location of a file fixture.
  class Fixture
    def initialize(raw_path)
      @raw_path = raw_path
    end

    def read
      pathname.read
    end

    def xml
      require 'nokogiri'
      Nokogiri::XML.parse(read)
    end

    def path
      pathname.realpath.to_s
    rescue Errno::ENOENT
      pathname.expand_path.to_s
    end

    # rubocop:disable Style/OptionalBooleanParameter
    def json(symbolize_names_shorthand = true, symbolize_names: true)
      JSON.parse(read, symbolize_names: symbolize_names & symbolize_names_shorthand)
    end

    def yaml(symbolize_names_shorthand = true, symbolize_names: true)
      YAML.safe_load(read, symbolize_names: symbolize_names & symbolize_names_shorthand)
    end
    # rubocop:enable Style/OptionalBooleanParameter

    alias yml yaml

    private

    def pathname
      @pathname ||= base_path.join(@raw_path)
    end

    def base_path
      Pathname.new(File.join('spec', 'fixtures'))
    end
  end
end
