# RSpec::FileFixtures

A simple and convenient file fixture loader for [_RSpec_](https://rspec.info/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-file_fixtures', '~> 0.1.6'
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
it 'parses JSON data' do
  expect(subject.load(my_fixture.read)).to eql my_fixture.from_json
end
```

```ruby
it 'contains same filenames as fixture directory' do
  # `#dirname` delegated to underlying `Pathname` object, returning a new `Pathname` instance:
  expect(subject.created_files).to eql my_fixture.dirname.entries
end
```

The following methods are provided on the `Fixture` object:

|Method|Definition|
|-|-|
|`#read`|Read the contents of the fixture file as a string|
|`#path`|The absolute path to the fixture file|
|`#from_json`|The parsed _JSON_ content from the file|
|`#from_yaml`|The parsed _YAML_ content from the file (aliased as `#from_yml`)|
|`#from_xml`|The parsed _XML_ content from the file (requires the [_Nokogiri_](https://nokogiri.org/) gem and returns a `Nokogiri::XML::Document`)|

Methods not specifically defined above are delegated to the underlying `Pathname` object (`#join`, `#dirname`, `#mkpath`, etc.). See the [Pathname documentation](https://ruby-doc.org/stdlib-2.7.5/libdoc/pathname/rdoc/Pathname.html) for more details.

### Symbolize Names

By default `Fixture#from_yaml` and `Fixture#from_json` symbolize all keys in their output. To disable this behaviour, pass `symbolize_names: false` to either method. A shorthand version of this is available by simply passing `false` as the only parameter:

```ruby
  expect(subject.load(my_fixture.from_yaml(symbolize_names: false))).to eql({ 'foo' => 'bar' })
  expect(subject.load(my_fixture.from_json(symbolize_names: false))).to eql({ 'foo' => 'bar' })
  expect(subject.load(my_fixture.from_yaml(false))).to eql({ 'foo' => 'bar' })
  expect(subject.load(my_fixture.from_json(false))).to eql({ 'foo' => 'bar' })
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
