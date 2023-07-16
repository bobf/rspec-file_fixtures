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

    def copy_to(destination)
      FileUtils.copy(pathname, destination)
    end

    def from_xml
      require 'nokogiri'
      Nokogiri::XML.parse(read)
    end

    def path
      pathname.realpath.to_s
    rescue Errno::ENOENT
      pathname.expand_path.to_s
    end

    # rubocop:disable Style/OptionalBooleanParameter
    def from_json(symbolize_names_shorthand = true, symbolize_names: true)
      JSON.parse(read, symbolize_names: symbolize_names & symbolize_names_shorthand)
    end

    def from_yaml(symbolize_names_shorthand = true, symbolize_names: true)
      YAML.safe_load(read, symbolize_names: symbolize_names & symbolize_names_shorthand)
    end
    # rubocop:enable Style/OptionalBooleanParameter

    alias from_yml from_yaml

    # Backward compatibility
    alias yml from_yml
    alias yaml from_yaml
    alias xml from_xml
    alias json from_json
    # /Backward compatibility

    private

    def method_missing(method_name, *args)
      return pathname.public_send(method_name, *args) if respond_to_missing?(method_name)

      super
    end

    def respond_to_missing?(method_name, _ = false)
      return true if pathname.respond_to?(method_name)

      super
    end

    def pathname
      @pathname ||= base_path.join(@raw_path)
    end

    def base_path
      Pathname.new(File.join('spec', 'fixtures'))
    end
  end
end
