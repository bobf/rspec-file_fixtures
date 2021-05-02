# RSpec::FileFixtures

A simple and convenient file fixture loader for [_RSpec_](https://rspec.info/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-file_fixtures', '~> 0.1.4'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rspec-file_fixtures

## Usage

Load the gem in your test environment (e.g. in `spec/spec_helper.rb`):

```ruby
require 'rspec/file_fixtures'
```

Use the `fixture` helper method to load a fixture from `spec/fixtures`:

```ruby
let(:my_fixture) { fixture('fixture.json') }
```

Use the returned `Fixture` object's various methods in your tests:

```ruby
it 'loads data' do
  expect(subject.load(my_fixture.read)).to eql my_fixture.json
end
```

The following methods are provided on the `Fixture` object:

|Method|Definition|
|-|-|
|`#read`|Read the contents of the fixture file as a string|
|`#path`|The absolute path to the fixture file|
|`#json`|The parsed _JSON_ content from the file|
|`#yaml`|The parsed _YAML_ content from the file (aliased as `#yml`)|
|`#xml`|The parsed _XML_ content from the file (requires the [_Nokogiri_](https://nokogiri.org/) gem and returns a `Nokogiri::XML::Document`)|

### Symbolize Names

By default `Fixture#yaml` and `Fixture#json` symbolize all keys in their output. To disable this behaviour, pass `symbolize_names: true` to either method. A shorthand version of this is available by simply passing `false` as the only parameter:

```ruby
  expect(subject.load(my_fixture.yaml(symbolize_names: false))).to eql({ 'foo' => 'bar' })
  expect(subject.load(my_fixture.json(symbolize_names: false))).to eql({ 'foo' => 'bar' })
  expect(subject.load(my_fixture.yaml(false))).to eql({ 'foo' => 'bar' })
  expect(subject.load(my_fixture.json(false))).to eql({ 'foo' => 'bar' })
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
