# frozen_string_literal: true

require_relative 'lib/rspec_file_fixtures/version'

Gem::Specification.new do |spec|
  spec.name          = 'rspec-file_fixtures'
  spec.version       = RSpecFileFixtures::VERSION
  spec.authors       = ['Bob Farrell']
  spec.email         = ['git@bob.frl']
  spec.licenses      = ['MIT']

  spec.summary       = 'Simple file fixture loader for RSpec'
  spec.description   = 'Load files from test fixtures directory quickly and conveniently'
  spec.homepage      = 'https://github.com/bobf/rspec-file_fixtures'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'bin'
  spec.executables   = []
  spec.require_paths = ['lib']
  spec.add_runtime_dependency 'rspec', '~> 3.12'
end
