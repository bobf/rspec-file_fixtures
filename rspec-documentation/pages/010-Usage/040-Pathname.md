# Pathname

The object returned from each call to `fixture` delegates to its underlying [`Pathname`](https://docs.ruby-lang.org/en/3.2/Pathname.html) object, so you can call `#path`, `#read`, `#dirname` etc. just like a regular _Ruby_ `Pathname` object.

```rspec:xml
subject { fixture('example.xml').read }

it { is_expected.to include '<a type="integer">1</a>' }
```

```rspec
subject { fixture('example.json').dirname.to_s }

it { is_expected.to eql 'spec/fixtures' }
```

```rspec
subject { fixture('example.json').relative? }

it { is_expected.to be true }
```
