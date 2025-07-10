# Introduction

_RSpec::FileFixtures_ provides convenient and consistent access to fixture data in _RSpec_.

## Installation

Add the following to your `Gemfile` in your `:test` group:

```ruby
gem 'rspec-file_fixtures', '~> 0.1.6'
```

## Setup

Enable the _RSpec_ extension is your spec helper:

```ruby
# spec/spec_helper.rb

require 'rspec/file_fixtures'
```

## Usage

Use the provided `fixture` helper anywhere in your tests to load content from `spec/fixtures/`:

```rspec:json
subject { load_fixture('example.json').read }

it { is_expected.to include '{"key":"value"}' }
```

See the [Usage](usage.html) section for available extensions.
