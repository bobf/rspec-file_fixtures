# frozen_string_literal: true

module RSpec
  module FileFixtures
    # Provides access to the contents and location of a file fixture.
    class Fixture
      def initialize(raw_path)
        @raw_path = raw_path
      end

      def read
        pathname.read
      end

      def yaml
        YAML.safe_load(read, symbolize_names: true)
      end

      alias yml yaml

      def xml
        require 'nokogiri'
        Nokogiri::XML.parse(read)
      end

      def path
        pathname.realpath.to_s
      end

      def json
        JSON.parse(read, symbolize_names: true)
      end

      private

      def pathname
        @pathname ||= base_path.join(@raw_path)
      end

      def base_path
        Pathname.new(File.join('spec', 'fixtures'))
      end
    end
  end
end
