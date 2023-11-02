# Upload

Create a `Rack::Test::UploadedFile` instance by calling `#upload(content_type: 'image/png')` (e.g.).

The returned object can be passed as a parameter in a _request_ spec to simulate uploading a file.

```rspec
subject { fixture('example.xml').upload(content_type: 'application/xml') }

it { is_expected.to be_a Rack::Test::UploadedFile }
```
