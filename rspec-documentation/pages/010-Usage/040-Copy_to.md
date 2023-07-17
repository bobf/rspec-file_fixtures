# Copy_to

You can use the `#copy_to(destination)` method to copy the fixture file to the destination path. The `#copy_to` method expects a path or string. See examples at [FileUtils#cp](https://rubyapi.org/3.3/o/fileutils#method-i-cp) method, which this method basically wraps. By using `#copy_to`, you can achieve faster file copying compared to the `File#read` then `File#write` approach, as it avoids loading the entire file into memory.

```rspec
let(:example_fixture) { fixture('example.json') }

subject(:destination_path) { File.join(Dir.mktmpdir, 'path/to/destination/copied.json') }

before { example_fixture.copy_to(destination_path) }

after { File.unlink(destination_path) }

it 'copies file content' do
  expect(File).to exist(destination_path)
end
```
