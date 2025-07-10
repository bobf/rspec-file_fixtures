# JSON

_JSON_ fixtures can be parsed into a _Ruby_ object using the `#from_json` method.

This is equivalent to `JSON.parse(..., symbolize_names: true)`.

```rspec
subject { load_fixture('example.json').from_json }

it { is_expected.to eql({ key: 'value' }) }
```

## Symbolized Names

Keys are symbolized by default. If you prefer to work with strings, pass `symbolize_names: false`:

```rspec
subject { load_fixture('example.json').from_json(symbolize_names: false) }

it { is_expected.to eql({ 'key' => 'value' }) }
```
