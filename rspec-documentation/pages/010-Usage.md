# Usage

_RSpec::FileFixtures_ provides a helper named `file_fixture` available in all specs. This method receives a filename as a string and the provided file is loaded from `spec/fixtures/`.

Fetch the fixture's path:

```rspec
subject { load_fixture('example.yaml').path }

it { is_expected.to end_with '/spec/fixtures/example.yaml' }
```

Read the fixture's content:

```rspec:yaml
subject { load_fixture('example.yaml').read }

it { is_expected.to include 'key: value' }
```

A number of extensions are provided to assist dealing with common data types. See each item in the Usage section for details.
