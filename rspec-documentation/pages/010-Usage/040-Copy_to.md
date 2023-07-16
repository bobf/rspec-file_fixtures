# Copy_to

You can use `#copy_to(destination)` method to copy the fixture file to the destination path. Destination method expects a path or string that will copy the file into. See examples at [FileUtils#cp](https://rubyapi.org/3.3/o/fileutils#method-i-cp) method, which this method basically wraps. By using #copy_to, you can achieve faster file copying compared to the fixture#read then File#write approach, as it avoids loading the entire file into memory.

```rspec
let(:fixture) { fixture('example.json') }
subject(:destination_path) { 'path/to/destination/copied.json' }

before do
  fixture.copy_to(destination_path)
end

it { is_expected.to be_file }
```
