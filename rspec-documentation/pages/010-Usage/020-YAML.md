# YAML

_YAML_ fixtures can be parsed into a _Ruby_ object using the `#from_yaml` method.

This is equivalent to `YAML.safe_load(..., symbolize_names: true)`.

```rspec
subject { fixture('example.yaml').from_yaml }

it { is_expected.to eql({ key: 'value' }) }
```

## Symbolized Names

Keys are symbolized by default. If you prefer to work with strings, pass `symbolize_names: false`:

```rspec
subject { fixture('example.yaml').from_yaml(symbolize_names: false) }

it { is_expected.to eql({ 'key' => 'value' }) }
```
